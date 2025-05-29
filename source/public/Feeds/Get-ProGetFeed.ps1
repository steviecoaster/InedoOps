function Get-ProGetFeed {
    <#
    .SYNOPSIS
    Returns information about the available feeds in your ProGet instance
    
    .DESCRIPTION
    Supports returning all feeds, feeds by type, or by name
    
    .PARAMETER Feed
    The feed to return
    
    .PARAMETER Type
    The type of feed to return
    
    .EXAMPLE
    Get-ProGetFeed

    Return all feeds

    .EXAMPLE
    Get-ProGetFeed -Type nuget

    Return all nuget feeds

    .EXAMPLE

    Get-ProGetFeed -Feed ChocolateyPackages

    Return the ChocolateyPackages feed
    
    .NOTES

    #>
    [CmdletBinding(HelpUri = 'https://steviecoaster.github.io/Pagootle/Get-ProGetFeed')]
    Param(
        [Parameter()]
        [String]
        $Feed,

        [Parameter()]
        [ValidateSet('asset', 'bower', 'conda', 'chocolatey', 'debianlegacy', 'debian', 'docker', 'helm', 'maven', 'npm', 'nuget', 'powershell', 'universal', 'pypi', 'romp', 'rpm', 'rubygems', 'vsix')]
        [String]
        $Type
    )
    end {
        if($Feed -and $Type){
            throw 'Only one parameter of Feed or Type can be used at a time'
        }
        $params = @{
            Method = 'GET'
        }

        if ($Feed) {
            $params['Slug'] = '/api/management/feeds/get/{0}' -f $Feed
        }
        else {
            $params['Slug'] = '/api/management/feeds/list'
        }

        $result = Invoke-ProGet @params

        if ($Type) {
            $filter = { $_.feedType -eq $Type }
            $result | Where-Object $filter
        }
        else {
            $result
        }
    }
}