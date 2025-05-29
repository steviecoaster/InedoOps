function Get-ProGetTask {
<#
    .SYNOPSIS
    Retrieves tasks from ProGet.

    .DESCRIPTION
    The `Get-ProGetTask` function retrieves a list of tasks from ProGet by invoking the corresponding stored procedure.

    .EXAMPLE
    Get-ProGetTask

    Retrieves all tasks from ProGet.
#>
    [CmdletBinding(HelpUri = 'https://steviecoaster.github.io/Pagootle/Get-ProGetTask')]
    Param()
    
    end {
        Invoke-GetTaskStoredProc
    }
}