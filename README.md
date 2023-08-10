<!--LINK_DEFINITIONS:START-->
[SOURCE_CODE]: ./Source/
[BUILD]: ./Build/
[DOCS]: ./Docs/
[TESTS]: ./Tests/
[CHANGELOG]: ./CHANGELOG.md
[LICENSE]: ./LICENSE.md
[CONTRIBUTING]: ./.github/CONTRIBUTING.md
[CoC]: ./.github/CODE_OF_CONDUCT.md
[SECURITY]: ./.github/SECURITY.md
[BUGS]: https://github.com/jimbrig/PowerShell-Module-Template/issues
[ROADMAP]: ./Docs/Development/Roadmap.md
[DOCS_SITE]: https://docs.jimbrig.com/PowerShell-Module-Template/
[LOGO]: ./Docs/Assets/img/logo.png
[PWSH_LOGO]: ./Docs/Assets/img/pwsh.png
[FAVICON]: ./Docs/Assets/favicon.ico
[LATEST_RELEASE]: https://github.com/jimbrig/PowerShell-Module-Template/releases/latest
[PSGALLERY]: https://www.powershellgallery.com/packages/PowerShell-Module-Template/
<!--LINK_DEFINITIONS:END-->

<!--TITLE:START-->

<p style="vertical-alignment:middle; text-align:center; inline-block; width:100%;">
    <img src="./Docs/Assets/img/pwsh.png" alt="PowerShell Core" width="84" height="64" align="left" />
    <h1 align="center">PowerShell Module Template</h1>
    <img src="./Docs/Assets/img/logo.png" alt="Logo" width="84" height="64" style="float:right" />
</p>

<!--TITLE:END-->

<br>
<hr>

<!--DESCRIPTION:START-->

<p align="center">
  <em>PowerShell Core Module Template Containing Various Utility and Helpers for Advanced Development Experience.</em>
</p>

<!--DESCRIPTION:END-->

<hr>

<!--LINKS:START-->

<p align="center">
    <br>
    <br>
    <b>Links:</b>
    <br>
    <a href=[SOURCE_CODE]>Source Code</a> |
    <a href=[DOCS_SITE]>Published Documentation</a> |
    <a href=[LATEST_RELEASE]>Latest Release: [v0.0.2]</a> |
    <a href=[PSGALLERY]>PowerShell Gallery</a>
    <br>
    <br>
    <em>View the repo's <a href=[CHANGELOG]>CHANGELOG</a> for details on the progression of the codebase over time.</em>
    <br>
    <br>
</p>

<!--LINKS:END-->

<hr>

<h2 align="center">Badges</h2>

<span align="center">

<!--BADGES:START-->

[![PowerShell Gallery Version](https://img.shields.io/powershellgallery/v/PSXLDevTools?color=0092ff&label=PowerShell%20Gallery&logoColor=0092ff)](https://www.powershellgallery.com/packages/PSXLDevTools/)

[![Test Module](https://github.com/jimbrig/PSXLDevTools/actions/workflows/test.yml/badge.svg)](https://github.com/jimbrig/PSXLDevTools/actions/workflows/test.yml)
[![Build Module](https://github.com/jimbrig/PSXLDevTools/actions/workflows/build.yml/badge.svg)](https://github.com/jimbrig/PSXLDevTools/actions/workflows/build.yml)

[![Publish Module](https://github.com/jimbrig/PSXLDevTools/actions/workflows/publish.yml/badge.svg)](https://github.com/jimbrig/PSXLDevTools/actions/workflows/publish.yml)
[![Publish Documentation](https://github.com/jimbrig/PSXLDevTools/actions/workflows/mkdocs.yml/badge.svg)](https://github.com/jimbrig/PSXLDevTools/actions/workflows/mkdocs.yml)

[![Publish GitHub NuGet Package](https://github.com/jimbrig/PSXLDevTools/actions/workflows/ghpkg.yml/badge.svg)](https://github.com/jimbrig/PSXLDevTools/actions/workflows/ghpkg.yml)
[![Automate Changelog](https://github.com/jimbrig/PSXLDevTools/actions/workflows/changelog.yml/badge.svg)](https://github.com/jimbrig/PSXLDevTools/actions/workflows/changelog.yml)

<!--BADGES:END-->

</span>
<hr>


## Contents

<details>
<summary>Table of Contents</summary>

<!-- AUTO-GENERATED-CONTENT:START (TOC) -->

<!-- AUTO-GENERATED-CONTENT:END -->

</details>

## Repository Structure

<details>
<summary>Click to Expand Repository File Structure Diagram</summary>

```powershell
> tree /F
<root>
│
├───bin
│       Install-RequiredModules.ps1
│       Invoke-PesterStub.ps1
│       Update-ReadMeIndex.ps1
│
├───docs
│   └───en-US
│           about_PSXLDevTools.help.md
│
├───PSXLDevTools
│   │   PSXLDevTools.psd1
│   │   PSXLDevTools.psm1
│   │
│   ├───Dev
│   │   │   Invoke-XLBuild.ps1
│   │   │   New-VBAProject.ps1
│   │   │   New-VBAProjectConfig.ps1
│   │   │
│   │   ├───Exports
│   │   │       Export-CustomCellStyles.ps1
│   │   │       Export-DataMashup.ps1
│   │   │       Export-ListObject.ps1
│   │   │       Export-ListObjects.ps1
│   │   │       Export-PowerQuery.ps1
│   │   │       Export-PowerQueryConnection.ps1
│   │   │       Export-TableStyles.ps1
│   │   │       Export-VBAComponent.ps1
│   │   │       Export-VBAProjectProps.ps1
│   │   │       Export-VBAReferences.ps1
│   │   │       Export-WorksheetMetadata.ps1
│   │   │       Export-XLConditionalFormatting.ps1
│   │   │       Export-XLCustomLists.ps1
│   │   │       Export-XLCustomRibbonX.ps1
│   │   │       Export-XLDataModel.ps1
│   │   │       Export-XLDataValidation.ps1
│   │   │       Export-XLDocumentProps.ps1
│   │   │       Export-XLPivotCache.ps1
│   │   │       Export-XLPivotTable.ps1
│   │   │       Export-XLTheme.ps1
│   │   │       Export-XLThemeColors.ps1
│   │   │       Export-XLThemeFonts.ps1
│   │   │
│   │   └───Imports
│   │           Import-DataMashup.ps1
│   │
│   ├───Private
│   │       GetHelloWorld.ps1
│   │
│   └───Public
│           Export-PowerQueries.ps1
│           Get-HelloWorld.ps1
│
├───resources
│   │   dirtree.js
│   │   md.config.js
│   │
│   └───images
│           excel.ico
│           office365.ico
│           powershell.ico
│           powershellcore-preview.ico
│           powershellcore.png
│           regedit.ico
│           win10.ico
│           windowspowershell.ico
│
├───tests
│   │   Export-PowerQueries.tests.ps1
│   │   Help.tests.ps1
│   │   Manifest.tests.ps1
│   │   Meta.tests.ps1
│   │   MetaFixers.psm1
│   │   ScriptAnalyzerSettings.psd1
│   │
│   └───TestWorkbooks
│
│   .editorconfig
│   .gitattributes
│   .gitignore
│   build.ps1
│   CHANGELOG.md
│   cliff.toml
│   LICENSE
│   mkdocs.yml
│   psakeFile.ps1
│   README.md
│   RequiredModules.psd1
│   requirements.psd1
│
├───.devcontainer
│       devcontainer.json
│       Dockerfile
│
├───.github
│   │   CONTRIBUTING.md
│   │   ISSUE_TEMPLATE.md
│   │   PULL_REQUEST_TEMPLATE.md
│   │
│   └───workflows
│           build.yml
│           changelog.yml
│           lint.yml
│           mkdocs.yml
│           publish.yml
│           readme.yml
│           test.yml
│
├───.vscode
│       extensions.json
│       launch.json
│       settings.json
│       tasks.json
```

</details>

## Installation

Install via the [PowerShell Gallery][PSGALLERY]:

```powershell
# Using PowerShellGet (in PowerShell 5.0+)
Install-Module -Name PSModuleTemplate -Scope CurrentUser -Force

# Using new PSResourceGet (in PowerShell 7.0+)
Install-PSResource -Name PSModuleTemplate -Repository PSGallery -Scope CurrentUser -Force
```

## Usage

```powershell

```

***

## Appendices

### References

- [ ] TODO

### Acknowledgements

- [ ] TODO

### Contributing

- [ ] TODO

### License

- [License][LICENSE]

***

Jimmy Briggs | 2023
