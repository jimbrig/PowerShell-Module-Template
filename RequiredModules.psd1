@{
    PSDependOptions    = @{
        AddToPath  = $true
        Target     = '\Build\Library'
        Parameters = @{}
    }

    # NuGet Version Reference:
    # https://docs.microsoft.com/en-us/nuget/reference/package-versioning#version-ranges-and-wildcards

    "Configuration"    = "[1.3.1, 2.0)"
    "ModuleBuilder"    = "1.*"
    InvokeBuild        = 'latest'
    ModuleBuilder      = 'latest'
    BuildHelpers       = 'latest'
    psake              = 'latest'
    PowerShellBuild    = 'latest'

    PSDeploy           = 'latest'
    PlatyPS            = 'latest'

    PSScriptAnalyzer   = 'latest'

    Pester             = 'latest'

    Plaster            = 'latest'

    MarkdownLinkCheck  = 'latest'
    MarkdownSpellCheck = 'latest'
    MarkdownTOC        = 'latest'

}
