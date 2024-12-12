function Get-ProGetConfiguration {
    [CmdletBinding()]
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