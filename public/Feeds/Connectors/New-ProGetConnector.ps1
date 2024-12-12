function New-ProGetConnector {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Name,

        [Parameter(Mandatory)]
        [ValidateSet('universal','nuget','chocolatey','npm','maven','powershell','docker','rubygems','vsix','asset','romp','pypi','helm','rpm','conda','cran')]
        [String]
        $FeedType,

        [Parameter()]
        [String]
        $Url,

        [Parameter(Mandatory)]
        [Int]
        $Timeout,

        [Parameter()]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter()]
        [String[]]
        $Filters,

        [Parameter()]
        [Switch]
        $MetadataCacheEnabled,

        [Parameter()]
        [Int]
        $MetadataCacheMinutes = 30, #Hard default in ProGet, default value is ignored by this module code due to PSBoundParameters

        [Parameter()]
        [Int]
        $MetadataCacheCount = 100 #Hard default in ProGet, default value is ignored by this module code due to PSBoundParameters
    )

    process {

        $feedUrlDefaults = @{
            universal = $null
            nuget = 'https://api.nuget.org/v3/index.json'
            chocolatey = 'https://community.chocolatey.org/api/v2'
            npm = 'https://registry.npmjs.org'
            maven = 'https://repo1.maven.org/maven2'
            bower = 'https://registry.bower.io/packages' 
            docker = 'https://registry.hub.docker.com'
            debian = 'http://ftp.debian.org/debian/' 
            pypi = 'https://pypi.org'
            conda = 'https://repo.anaconda.com/pkgs/main/'
            cran = 'https://cran.r-project.org/'
        }

        $body = @{}

        if(-not $url){
            $body.Add('url',$feedUrlDefaults["$FeedType"]) #if they pass one, the url will get updated in the enumeration below, so this is fine.
        }

        $PSBoundParameters.GetEnumerator() | ForEach-Object {
            if($_.Key -eq 'Credential'){
                $tempCred = $_.Value
                $body.Add('username',$tempCred.Username)
                $body.Add('password',$tempCred.GetNetworkCredential().Password)
            } else {
                $body.Add($_.Key,$_.Value)
            }
        }


        $params = @{
            Slug = '/api/management/connectors/create'
            Method = 'POST'
            Body = $body
        }

        Invoke-Proget @params
    }
}