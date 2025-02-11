function Invoke-ProGet {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory, Position = 0)]
        [String]
        $Slug,

        [Parameter()]
        [Microsoft.PowerShell.Commands.WebRequestMethod]
        $Method = 'GET',

        [Parameter()]
        [Hashtable]
        $Body,

        [Parameter()]
        [Hashtable]
        $Form,

        [Parameter()]
        [String]
        $BodyJson,

        [Parameter()]
        [String]
        $File,

        [Parameter()]
        [String]
        $ContentType = 'application/json'
    )

    begin {
        $Configuration = Get-ProGetConfiguration
    }

    end {

        $ssl = if ($Configuration['UseSSL']) {
            @{Protocol = 'https' ; Port = $Configuration['SslPort'] }
        }
        else {
            @{Protocol = 'http'; Port = $Configuration['NonSslPort'] }
        }
        $Uri = '{0}:{1}{2}' -f "$($ssl['Protocol'])://$($Configuration['Hostname'])", $ssl['Port'], $Slug.TrimEnd('/')

        Write-Verbose -Message $Uri
        $params = @{
            Uri                  = $Uri
            Method               = $Method
            ContentType          = $ContentType
            Headers              = @{'X-ApiKey' = $Configuration.Credential.GetNetworkCredential().Password }
            SkipCertificateCheck = $true
            Verbose              = $false
        }

        if ($Body) {
            $params['Body'] = $Body | ConvertTo-Json -Depth 5
        }

        if ($BodyJson) {
            $params['Body'] = $BodyJson
        }

        if ($Form) {
            $params['Form'] = $Form
            $params.Remove('ContentType')
        }

        if ($File) {
            $fileContent = [System.IO.File]::ReadAllBytes($File)
            $params['Body'] = $fileContent
            $params['ContentType'] = 'application/octet-stream'
            Write-Verbose $params.Uri
        }

        #Write-Verbose ($Body | ConvertTo-Json -Depth 5)
        Invoke-RestMethod @params
    }
}