function Invoke-GetTaskStoredProc {
    [CmdletBinding()]
    Param()

    end {
        # Execute locally
        Add-Type -AssemblyName "System.Data"
        $StoredProcedure = 'dbo.Security_GetTasks'
        $ConnectionString = Get-ProGetConnectionString

        $connection = [System.Data.SqlClient.SqlConnection]::new($ConnectionString)
        $connection.Open()

        try {
            $command = $connection.CreateCommand()
            $command.CommandType = [System.Data.CommandType]::StoredProcedure
            $command.CommandText = $StoredProcedure

            $reader = $command.ExecuteReader()
            $results = [System.Collections.Generic.List[pscustomobject]]::new()

            while ($reader.Read()) {
                $row = @{}
                for ($i = 0; $i -lt $reader.FieldCount; $i++) {
                    $column = $reader.GetName($i)
                    $row[$column] = $reader.GetValue($i)
                }
                $results.Add([PSCustomObject]$row)
            }
            $reader.Close()

            $results
        }
        catch {
            Write-Error "An error occurred: $_"
        }
        finally {
            $connection.Close()
        }
    }
}