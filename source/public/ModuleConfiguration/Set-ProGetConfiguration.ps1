function Set-ProGetConfiguration {
    <#
    .SYNOPSIS
    Sets the configuration for connecting to ProGet.

    .DESCRIPTION
    The `Set-ProGetConfiguration` function allows you to configure the connection settings for ProGet, including hostname, credentials, ports, and SSL options. The configuration can be saved with a custom name for later use.

    .PARAMETER Hostname
    The hostname of the ProGet server. This parameter is mandatory.

    .PARAMETER Credential
    A PSCredential object containing the username and password for authenticating with the ProGet server. This parameter is mandatory.

    .PARAMETER NonSslPort
    The port to use for non-SSL connections. Defaults to 8624.

    .PARAMETER UseSSL
    Specifies whether to use SSL for the connection. This parameter is part of the 'ssl' parameter set.

    .PARAMETER SslPort
    The port to use for SSL connections. Defaults to 443. This parameter is mandatory when `UseSSL` is specified.

    .PARAMETER Name
    The name of the configuration to save. Defaults to 'ProGet'.

    .PARAMETER ApiKey
    The API key to use for authentication. Defaults to 'SetMe'.

    .EXAMPLE
    Set-ProGetConfiguration -Hostname "proget.example.com" -Credential (Get-Credential)

    Sets the configuration for ProGet with the specified hostname and credentials.

    .EXAMPLE
    Set-ProGetConfiguration -Hostname "proget.example.com" -ApiKey asdf8675309

    Sets the configuration for ProGet with the specified hostname and apikey

    .EXAMPLE
    Set-ProGetConfiguration -Hostname "proget.example.com" -ApiKey asdf8675309 -Credential (Get-Credential)

    Sets the configuration for ProGet with the specified hostname, credential, and apikey

    .EXAMPLE
    Set-ProGetConfiguration -Hostname "proget.example.com" -Credential (Get-Credential) -UseSSL -SslPort 8443

    Sets the configuration for ProGet with SSL enabled and a custom SSL port.

    .EXAMPLE
    Set-ProGetConfiguration -Hostname "proget.example.com" -Credential (Get-Credential) -Name "CustomConfig"

    Sets the configuration for ProGet with a custom configuration name.
#>
    [CmdletBinding(HelpUri = 'https://steviecoaster.github.io/Pagootle/Commands/Set-ProGetConfiguration' , DefaultParameterSetName = 'Apikey')]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Hostname,

        [Parameter(Mandatory, ParameterSetName = 'Credential')]
        [Parameter(Mandatory, ParameterSetName = 'Both')]
        [System.Management.Automation.PSCredential]
        $Credential,
        
        [Parameter()]
        [Int]
        $NonSslPort = '8624',

        [Parameter()]
        [Switch]
        $UseSSL,

        [Parameter()]
        [Int]
        $SslPort = 443,

        [Parameter()]
        [String]
        $Name = 'ProGet',

        [Parameter(Mandatory, ParameterSetName = 'Apikey')]
        [Parameter(Mandatory, ParameterSetName = 'Both')]
        [String]
        $ApiKey
    )

    end {
        $Configuration = @{
            Hostname   = $Hostname
            NonSslPort = $NonSslPort
        }

        if ($UseSSL) {
            $Configuration.Add('UseSSL', $UseSSL)
            $Configuration.Add('SSLPort', $SslPort)
        }

        switch ($PSCmdlet.ParameterSetName) {
            
            'Credential' {
                $Configuration.Add('Credential', $Credential)
            }

            'ApiKey' {
                $Configuration.Add('ApiKey', $([PSCredential]::new('null', ($ApiKey | ConvertTo-SecureString -AsPlainText -Force))))
            }

            'Both' {
                if (-not $Credential -or -not $ApiKey) {
                    throw "Both Credential and ApiKey must be provided when using the 'Both' parameter set."
                }
                
                $Configuration.Add('Credential', $Credential)
                $Configuration.Add('ApiKey', $([PSCredential]::new('null', ($ApiKey | ConvertTo-SecureString -AsPlainText -Force))))
            }
        }
        
        $Configuration | Export-Configuration -CompanyName $env:USERNAME -Name $Name -Scope User
    }
}