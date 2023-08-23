# GitHub Action Workflows

- `build.yml`: Build Module
- `version.yml`: Run [GitVersion]() to version Module
- `deps.yml`: Install (and cache) dependency modules (`ReuiqredModules.psd1`, `Requirements.psd1`, `*.depends.psd1`, etc.)
- `pester.yml`: Invoke Pester Tests and upload results/outputs as artifacts via `actions/upload-artifact` on the `.xml` results.
- `publish.yml`: Publish Module to PSGallery and [GitHub's NuGet Registry/Feed](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-nuget-registry) (i.e. `nuget.pkg.github.com`)

```yaml
name: Test PowerShell on Ubuntu
on: push

jobs:
  pester-test:
    name: Pester test
    runs-on: ubuntu-latest
    steps:
      - name: Check out repository code
        uses: actions/checkout@v3
      - name: Perform a Pester test from the command-line
        shell: pwsh
        run: Test-Path 'ResultsFile.log' | Should -Be $true
      - name: Perform a Pester test from the Tests.ps1 file
        shell: pwsh
        run: |
          Invoke-Pester Unit.Tests.ps1 -PassThru
```
