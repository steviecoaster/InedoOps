function Get-ProGetConfiguration {
<#
    .SYNOPSIS
    Retrieves the configuration for connecting to ProGet.

    .DESCRIPTION
    The `Get-ProGetConfiguration` function retrieves the configuration for ProGet. By default, it retrieves the configuration for ProGet unless a different configuration name is provided.

    .PARAMETER Configuration
    The name of the configuration to retrieve. Defaults to 'ProGet'.

    .EXAMPLE
    Get-ProGetConfiguration

    Retrieves the configuration for ProGet.

    .EXAMPLE
    Get-ProGetConfiguration -Configuration "CustomConfig"

    Retrieves the configuration for the configuration named "CustomConfige".
#>
    [CmdletBinding(HelpUri = 'https://steviecoaster.github.io/Pagootle/Commands/Get-ProGetConfiguration')]
    Param(
        [Parameter()]
        [Alias('Name')]
        [String]
        $Configuration = 'ProGet'
    )
    end {
        Import-Configuration -CompanyName $env:USERNAME -Name $Configuration
    }

}