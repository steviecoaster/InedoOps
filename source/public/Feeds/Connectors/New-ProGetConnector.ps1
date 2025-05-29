function New-ProGetConnector {
<#
    .SYNOPSIS
    Creates a new connector in ProGet.

    .DESCRIPTION
    The `New-ProGetConnector` function allows you to create a new connector in ProGet. Connectors are used to link feeds to external sources, such as NuGet, Chocolatey, Docker, and others. This function supports various feed types and allows configuration of metadata caching, filters, and credentials.

    .PARAMETER Name
    The name of the connector. This parameter is mandatory.

    .PARAMETER FeedType
    The type of feed the connector is associated with. Supported types include 'universal', 'nuget', 'chocolatey', 'npm', 'maven', 'powershell', 'docker', 'rubygems', 'vsix', 'asset', 'romp', 'pypi', 'helm', 'rpm', 'conda', and 'cran'. This parameter is mandatory.

    .PARAMETER Url
    The URL of the external source for the connector. If not specified, a default URL is used based on the feed type.

    .PARAMETER Timeout
    The timeout value (in seconds) for the connector. This parameter is mandatory.

    .PARAMETER Credential
    A PSCredential object containing the username and password for authentication with the external source.

    .PARAMETER Filters
    An array of filters to apply to the connector.

    .PARAMETER MetadataCacheEnabled
    Enables metadata caching for the connector.

    .PARAMETER MetadataCacheMinutes
    Specifies the duration (in minutes) for which metadata is cached. Defaults to 30 minutes.

    .PARAMETER MetadataCacheCount
    Specifies the maximum number of metadata items to cache. Defaults to 100 items.

    .EXAMPLE
    New-ProGetConnector -Name "NuGetConnector" -FeedType "nuget" -Timeout 60

    Creates a new NuGet connector named "NuGetConnector" with a timeout of 60 seconds.

    .EXAMPLE
    New-ProGetConnector -Name "DockerConnector" -FeedType "docker" -Url "https://custom.docker.registry" -Timeout 120 -Credential (Get-Credential)

    Creates a new Docker connector named "DockerConnector" with a custom URL, a timeout of 120 seconds, and authentication credentials.

    .EXAMPLE
    New-ProGetConnector -Name "FilteredConnector" -FeedType "npm" -Filters @("filter1", "filter2") -MetadataCacheEnabled

    Creates a new NPM connector named "FilteredConnector" with specified filters and metadata caching enabled.
#>
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