<#
#>
[CmdletBinding()]
Param(
    $Task = 'Default'
)

$Script:Modules = @(
    'BuildHelpers',
    'InvokeBuild',
    'LDModuleBuilder',
    'Pester',
    'platyPS',
    'PSScriptAnalyzer',
    'DependsOn'
)

$Script:ModuleInstallScope = 'CurrentUser'

Write-Host 'Starting Build...'
Write-Host 'Installing Module Dependencies...'

Get-PackageProvider -Name 'NuGet' -ForceBootstrap | Out-Null

Update-LDModule -Name $Script:Modules -Scope $Script:ModuleInstallScope

Set-BuildEnvironment
Get-ChildItem Env:BH*

$Error.Clear()

Write-Host 'Invoking Build...'

Invoke-Build $Task -Result 'Result'
if ($Result.Error) {
    $Error[-1].ScriptStackTrace | Out-String
    exit 1
}

exit 0
