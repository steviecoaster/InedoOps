function Set-ProGetConfiguration {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Hostname,

        [Parameter(Mandatory)]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [Switch]
        $UseSSL
    )

    end {
        @{
            Hostname   = $Hostname
            Credential = $Credential
            UseSSL     = $UseSSL
        } | Export-Configuration -CompanyName "Chocolatey Software" -Name ProGet -Scope User
    }
}