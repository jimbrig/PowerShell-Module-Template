$ModuleName = (Get-ChildItem "$PSScriptRoot\..\Source\*.psd1").BaseName
$PrimaryModule = Get-ChildItem -Path "$PSScriptRoot\..\Source\" -Filter '*.psd1' -Recurse -ErrorAction SilentlyContinue -Depth 1

If (-not $PrimaryModule) {
    Write-Error "Unable to find module in $PSScriptRoot\..\Source\" -ErrorAction Stop -ErrorId 'ModuleNotFound'
    Exit 1
}

If ($PrimaryModule.Count -ne 1) {
    Write-Error "Found more than one module in $PSScriptRoot\..\Source\" -ErrorAction Stop -ErrorId 'MultipleModulesFound'
    Exit 1
}

$PSD1Information = Import-PowerShellDataFile -Path $PrimaryModule.FullName

$RequiredModules = @(
    'Pester'
    'PSScriptAnalyzer'
    'PSWriteColor'
    if ($PSD1Information.RequiredModules) {
        $PSD1Information.RequiredModules
    }
)

ForEach ($Module in $RequiredModules) {
    if ($Module -is [System.Collections.IDictionary]) {
        $Exists = Get-Module -ListAvailable -Name $Module.ModuleName
        if (-not $Exists) {
            Write-Warning "$ModuleName - Downloading $($Module.ModuleName) from PSGallery"
            Install-Module -Name $Module.ModuleName -Force -SkipPublisherCheck
        }
    } else {
        $Exists = Get-Module -ListAvailable $Module -ErrorAction SilentlyContinue
        if (-not $Exists) {
            Install-Module -Name $Module -Force -SkipPublisherCheck
        }
    }
}

Write-Color 'ModuleName: ', $ModuleName, ' Version: ', $PSDInformation.ModuleVersion -Color Yellow, Green, Yellow, Green -LinesBefore 2
Write-Color 'PowerShell Version: ', $PSVersionTable.PSVersion -Color Yellow, Green
Write-Color 'PowerShell Edition: ', $PSVersionTable.PSEdition -Color Yellow, Green
Write-Color 'Required modules: ' -Color Yellow
foreach ($Module in $PSDInformation.RequiredModules) {
    if ($Module -is [System.Collections.IDictionary]) {
        Write-Color '   [>] ', $Module.ModuleName, ' Version: ', $Module.ModuleVersion -Color Yellow, Green, Yellow, Green
    } else {
        Write-Color '   [>] ', $Module -Color Yellow, Green
    }
}
Write-Color

Import-Module "$PSScriptRoot\..\Source\*.psd1" -Force
$Result = Invoke-Pester -Script "$PSScriptRoot\..\Tests" -Verbose -EnableExit

if ($Result.FailedCount -gt 0) {
    throw "$($Result.FailedCount) tests failed."
}

