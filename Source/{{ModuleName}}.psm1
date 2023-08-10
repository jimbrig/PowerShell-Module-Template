# -------------------------------------------------------
# {{ModuleName}} PowerShell Module
# -------------------------------------------------------

# Dot Source Functions (and Classes)
$Public = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Public/*.ps1')  -Recurse -ErrorAction Stop)
$Private = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Private/*.ps1') -Recurse -ErrorAction Stop)
$Classes = @()
$Enums = @()
$DSCResources = @()

If (!(Test-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Resources/Classes/'))) {
    $Classes = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Resources/Classes/*.ps1') -Recurse -ErrorAction Stop)
}

If (!(Test-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Resources/Enums/'))) {
    $Enums = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Resources/Enums/*.ps1') -Recurse -ErrorAction Stop)
}

If (!(Test-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Resources/DSCResources/'))) {
    $DSCResources = @(Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath 'Resources/DSCResources/*.ps1') -Recurse -ErrorAction Stop)
}

$All = @($Public + $Private + $Classes + $Enums + $DSCResources)

ForEach ($File in $All) {
    Try {
        . $File.FullName
    }
    Catch {
        Write-Warning -Message "Failed to import function $($File.FullName): $_"
    }
}

Export-ModuleMember -Function $Public.BaseName

