function New-ProGetGroup {
    <#
    .SYNOPSIS
    Create a new user group in ProGet
        
    .PARAMETER Name
    The group to create
    
    .EXAMPLE
    New-ProGetGroup -Name SomeGroup
    #>
    [CmdletBinding(HelpUri = 'https://steviecoaster.github.io/Pagootle/Commands/New-ProGetGroup')]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Name
    )
    end {
        Invoke-CreateGroupStoredProc -Name $Name
    }
}