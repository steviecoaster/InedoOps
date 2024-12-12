function Get-ProGetUser {
<#
.SYNOPSIS
Returns user account data from ProGet

.DESCRIPTION
Long description

.PARAMETER Username
The username to return

.EXAMPLE
Get-ProGetUser

Return data for all defined users

.EXAMPLE
Get-ProGetUser -Username bob

Return data for user bob
#>
    [CmdletBinding()]
    Param(
        [Parameter()]
        [String]
        $Username
    )

    end {
        Invoke-GetUserStoredProc @PSBoundParameters
    }
}
