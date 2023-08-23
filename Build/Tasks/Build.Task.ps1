using namespace System.Collections.Generic
using namespace System.IO
using namespace System.Management.Automation

Function Move-Statement {
    <#
    .SYNOPSIS
        Moves statements containing a specified token to the specified index in a file.
    .DESCRIPTION
        `Move-Statement` moves statements containing a specified token, to the specified index
        in a file.

        This can be used when building a module to move any `using` directives and `#Requires`
        statements to the top of a file.
    .PARAMETER Path
        Specifies the path to an item to get its contents.
    .PARAMETER Type
        Specifies the type of tokens to examine. Accepted values include "Comment" and "Keyword".
    .PARAMETER Token
        Specifies the contents to filter on when examining a supplied token.
    .PARAMETER Index
        Specifies the line to move a statement to. Each line in an item has a corresponding
        index, starting from 0.
    .EXAMPLE
    Move-Statement -Path $Path -Type 'Comment', 'Keyword' -Token '#Requires', 'using' -Index 0
    # Moves any using directives or #Requires statements to the top of a file.
    .NOTES
    From LDModuleBuilder
    #>
    [CmdletBinding(SupportsShouldProcess)]
    Param(
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [ValidateScript({ Test-Path -Path $PSItem })]
        [String]$Path,

        [Parameter(Position = 1, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [ValidateSet('Comment', 'Keyword')]
        [String[]]$Type = ('Comment', 'Keyword'),

        [Parameter(Position = 2, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [String[]]$Token = ('#Requires', 'using'),

        [Parameter(Position = 3, ValueFromPipelineByPropertyName)]
        [ValidateNotNullOrEmpty()]
        [Int]$Index = 0
    )

    Process {

        try {
            $Statements = [SortedSet[String]]::new(
                [StringComparer]::InvariantCultureIgnoreCase
            )

            Write-Verbose -Message "Reading content from $Path..."
            $Content = [List[String]] ([File]::ReadLines($Path))

            Write-Verbose -Message "Tokenizing content from $Path..."
            $Tokens = [PSParser]::Tokenize($Content, [ref] $null)
            $Match = $Token -join '|'
            Write-Verbose -Message 'Matching tokens...'
            Write-Verbose -Message "Type = [$Type]; Token = [$Token]"
            $Keywords = $Tokens.Where({
                    $PSItem.Type -in $Type -and $PSItem.Content -imatch "^(?:$match)"
                })
            if (-not $Keywords) {
                Write-Verbose -Message 'No matching tokens found! Returning...'
                return
            }
            $Offset = 1
            ForEach ($Keyword in $Keywords) {
                $Line = $Keyword.StartLine - $Offset
                Write-Verbose -Message "Moving [$($Content[$Line])] to Index [$Index]..."
                $null = $Statements.Add($Content[$Line]),
                $Content.RemoveAt($Line)
                $Offset++
            }
            [String[]]$Comments, [String[]]$Statements = $Statements.Where({
                    $PSItem -match '^#'
                }, 'Split')

            ForEach ($Item in ($Statements, $Comments)) {
                $Content.Insert($Index, '')
                $Content.InsertRange($Index, $Item)
            }
            if ($PSCmdlet.ShouldProcess($Path, $MyInvocation.MyCommand.Name)) {
                Write-Verbose -Message "Writing content to $Path..."
                [File]::WriteAllLines($Path, $content)
            }

        } catch {
            $PSCmdlet.ThrowTerminatingError($PSItem)
        }
    }
}

Task BuildModule @{
    Inputs  = (Get-ChildItem -Path $Source -Recurse -Filter *.ps1)
    Outputs = $ModulePath
    Jobs    = {
        $sb = [Text.StringBuilder]::new()
        $null = $sb.AppendLine('$Script:PSModuleRoot = $PSScriptRoot')

        # Class importer
        $root = Join-Path -Path $source -ChildPath 'Classes'
        "Load classes from [$root]"
        $classFiles = Get-ChildItem -Path $root -Filter '*.ps1' -Recurse |
            Where-Object Name -NotLike '*.Tests.ps1'

        $classes = @{}

        foreach ($file in $classFiles) {
            $name = $file.BaseName
            $classes[$name] = @{
                Name = $name
                Path = $file.FullName
            }
            $data = Get-Content $file.fullname
            foreach ($line in $data) {
                if ($line -match "\s+($Name)\s*(:|requires)\s*(?<baseclass>\w*)|\[(?<baseclass>\w+)\]") {
                    $classes[$name].Base += @($Matches.baseclass)
                }
            }
        }

        $importOrder = $classes.GetEnumerator() | Resolve-DependencyOrder -Key { $_.Name } -DependsOn { $_.Value.Base }

        foreach ($class in $importOrder) {
            $classPath = $class.Value.Path
            "Importing [$classPath]..."
            $null = $sb.AppendLine("# .$classPath")
            $null = $sb.AppendLine([IO.File]::ReadAllText($classPath))
        }

        foreach ($folder in ($Folders -ne 'Classes')) {
            if (Test-Path -Path "$Source\$folder") {
                $null = $sb.AppendLine("# Importing from [$Source\$folder]")
                $files = Get-ChildItem -Path "$Source\$folder" -Recurse -Filter *.ps1 |
                    Where-Object 'Name' -NotLike '*.Tests.ps1'

                foreach ($file in $files) {
                    $name = $file.Fullname.Replace($buildroot, '')

                    "Importing [$($file.FullName)]..."
                    $null = $sb.AppendLine("# .$name")
                    $null = $sb.AppendLine([IO.File]::ReadAllText($file.FullName))
                }
            }
        }

        "Creating Module [$ModulePath]..."
        $null = New-Item -Path (Split-Path $ModulePath) -ItemType Directory -ErrorAction SilentlyContinue -Force
        Set-Content -Path $ModulePath -Value $sb.ToString() -Encoding 'UTF8'

        'Moving "#Requires" statements and "using" directives...'
        Move-Statement -Path $ModulePath -Type 'Comment', 'Keyword' -Token '#Requires', 'using' -Index 0
    }
}
