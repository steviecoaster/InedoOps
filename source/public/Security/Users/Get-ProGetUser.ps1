function Get-ProGetUser {
<#
.SYNOPSIS
Returns user account data from ProGet

.PARAMETER Username
The username to return

.EXAMPLE
Get-ProGetUser

Return data for all defined users

.EXAMPLE
Get-ProGetUser -Username bob

Return data for user bob
#>
    [CmdletBinding(HelpUri = 'https://steviecoaster.github.io/Pagootle/Commands/Get-ProGetUser')]
    Param(
        [Parameter()]
        [String]
        $Username
    )

    end {
        Invoke-GetUserStoredProc @PSBoundParameters
    }
}
