Task CompileCSharp @{
    If      = (Get-ChildItem -Path $BuildRoot -Include *.csproj -Recurse)
    Inputs  = {
        Get-ChildItem $BuildRoot -Recurse -File -Include *.cs
    }
    Outputs = "$Destination\bin\$ModuleName.dll"
    Jobs    = {
        # This build command requires .Net Core
        "Building Module"
        $csproj = Get-ChildItem -Path $BuildRoot -Include *.csproj -Recurse
        $folder = Split-Path $csproj
        dotnet build $folder -c Release -o $Destination\bin
    }
}

Task CompilePwsh @{
    # Merge everything into a consolidated *.psm1
    If      = (Get-ChildItem -Path $BuildRoot -Include *.ps1 -Recurse)
    Inputs  = {
        Get-ChildItem $BuildRoot -Recurse -File -Include *.ps1
    }
    Outputs = "$Destination\$ModuleName.psm1"
    # TODO
}
