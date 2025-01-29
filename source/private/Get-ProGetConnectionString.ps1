function Get-ProGetConnectionString {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [ValidateScript({ Test-Path $_ })]
        [String]
        $ConfigFile = "C:\ProgramData\Inedo\SharedConfig\ProGet.config"
    )
    
    end {
        [xml]$xml = Get-Content $ConfigFile

        $xml.InedoAppConfig.ConnectionString
    }
}