function New-ProGetGroup {
    <#
    .SYNOPSIS
    Create a new user group in ProGet
    
    .DESCRIPTION
    
    
    .PARAMETER Name
    The group to create
    
    .EXAMPLE
    New-ProGetGroup - Name Pickles
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Name
    )
    end {
        Invoke-CreateGroupStoredProc -Name $Name
    }
}