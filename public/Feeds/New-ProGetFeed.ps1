function New-ProGetFeed {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Name,

        [Parameter()]
        [String]
        $AlternateNames,

        [Parameter()]
        [ValidateSet('asset', 'bower', 'conda', 'chocolatey', 'debianlegacy', 'debian', 'docker', 'helm', 'maven', 'npm', 'nuget', 'powershell', 'universal', 'pypi', 'romp', 'rpm', 'rubygems', 'vsix')]        [String]
        $Type = 'NuGet',

        [Parameter()]
        [Switch]
        $Active,

        [Parameter()]
        [Switch]
        $CacheConnectors,

        [Parameter()]
        [Switch]
        $SymbolServerEnabled,

        [Parameter()]
        [Switch]
        $StripSymbols,

        [Parameter()]
        [Switch]
        $StripSource,

        [Parameter()]
        [String]
        $EndpointUrl,

        [Parameter()]
        [String[]]
        $Connectors,

        [Parameter()]
        [String[]]
        $RetentionRules,

        [Parameter()]
        [Hashtable]
        $Variables,

        [Parameter()]
        [Switch]
        $CanPublish,

        [Parameter()]
        [Switch]
        $PackageStatisticsEnabled,

        [Parameter()]
        [Switch]
        $RestrictPackageStatistics,

        [Parameter()]
        [Switch]
        $DeploymentRecordsEnabled,

        [Parameter()]
        [Switch]
        $UsageRecordsEnabled,

        [Parameter()]
        [Switch]
        $VulnerabilitiesEnabled,

        [Parameter()]
        [Switch]
        $LicensesEnabled,

        [Parameter()]
        [Switch]
        $UseWithProjects
    )

    end {
        $params = @{
            Slug   = '/api/management/feeds/create'
            Method = 'POST'
            Body   = @{
                name                      = $Name
                alternateNames            = $AlternateNames
                feedType                  = $Type
                active                    = $Active.IsPresent
                cacheConnectors           = $CacheConnectors.IsPresent
                symbolServerEnabled       = $SymbolServerEnabled.IsPresent
                stripSymbols              = $StripSymbols.IsPresent
                stripsource               = $StripSource.IsPresent
                endpointUrl               = $EndpointUrl
                connectors                = $Connectors
                retentionRules            = $RetentionRules
                variables                 = $Variables
                canPublish                = $CanPublish.IsPresent
                packageStatisticsEnabled  = $PackageStatisticsEnabled.IsPresent
                restrictPackageStatistics = $RestrictPackageStatistics.IsPresent
                deploymentRecordsEnabled  = $DeploymentRecordsEnabled.IsPresent
                usageRecordsEnabled       = $UsageRecordsEnabled.IsPresent
                vulnerabilitiesEnabled    = $VulnerabilitiesEnabled.IsPresent
                licenseEnabled            = $LicensesEnabled.IsPresent
                useWithProjects           = $UseWithProjects.IsPresent
            }
        }

        Invoke-ProGet @params
    }
}