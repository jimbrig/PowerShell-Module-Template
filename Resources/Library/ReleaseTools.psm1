using module PowerShellForGitHub
using namespace System.Management.Automation

$script:ProjectRoot = (Get-Item $PSScriptRoot).Parent.Parent.FullName

$script:GitHubUser = 'jimbrig'
$script:RepoName = Split-Path -Path $ProjectRoot -Leaf


$script:PullRequests = @()
$script:BugFixes = @()
$script:NewFeatures = @()
$script:Repo = Get-GitHubRepository -OwnerName $GitHubUser -RepositoryName $RepoName
$script:Path = $ProjectRoot
$script:ChangelogFile = "$Path/CHANGELOG.md"

Function Update-Branch {
    <#
    .SYNOPSIS
        Creates and checks out the `release` branch if not already exists
    .DESCRIPTION

    .EXAMPLE

    .EXAMPLE

    #>
    [CmdletBinding()]
    Param(
        [Parameter()]
        [string]$BranchName = 'release'
    )

    $Branch = git branch --show-current

    if ($Branch -ne $BranchName) {
        if ($PSCmdlet.ShouldProcess($BranchName, "git checkout -B")) {
            git checkout -B $BranchName
        }
    }

}
