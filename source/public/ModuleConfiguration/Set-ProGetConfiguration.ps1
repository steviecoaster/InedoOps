function Set-ProGetConfiguration {
    [CmdletBinding(DefaultParameterSetName = 'default')]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Hostname,

        [Parameter(Mandatory)]
        [System.Management.Automation.PSCredential]
        $Credential,
        
        [Parameter()]
        [Int]
        $NonSslPort = '8624',

        [Parameter(ParameterSetName = 'ssl')]
        [Switch]
        $UseSSL,

        [Parameter(ParameterSetName = 'ssl', Mandatory)]
        [Int]
        $SslPort = 443,

        [Parameter()]
        [String]
        $Name = 'ProGet'
    )

    end {
        $Configuration = @{
            Hostname   = $Hostname
            Credential = $Credential
            NonSslPort = $NonSslPort
        }

        switch ($PSCmdlet.ParameterSetName) {
            'ssl' {
                $Configuration.Add('UseSSL', $UseSSL)
                $Configuration.Add('SSLPort', $SslPort)
            }
        }
        
        $Configuration | Export-Configuration -CompanyName $env:USERNAME -Name $Name -Scope User
    }
}