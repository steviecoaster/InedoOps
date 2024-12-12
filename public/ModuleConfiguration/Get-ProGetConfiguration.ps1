function Get-ProGetConfiguration {
    [CmdletBinding()]
    Param()
    end {
        Import-Configuration -CompanyName 'Chocolatey Software' -Name ProGet
    }

}