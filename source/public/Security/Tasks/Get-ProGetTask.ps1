function Get-ProGetTask {
    [CmdletBinding()]
    Param()
    
    end {
        Invoke-GetTaskStoredProc
    }
}