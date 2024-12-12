function Invoke-GetUserStoredProc {
    <#
        .SYNOPSIS
       Private function that executes dbo.Users_GetUsers stored procedure in ProGet Database
    #>
    [CmdletBinding()]
    Param(
        [Parameter()]
        [String]
        $Username
    )

    end {
                # Execute locally
                Add-Type -AssemblyName "System.Data"
                $StoredProcedure = 'dbo.Users_GetUsers'
                $ConnectionString = 'Server=Localhost\SQLEXPRESS;Database=ProGet;Trusted_Connection=true;'
        
                $connection = [System.Data.SqlClient.SqlConnection]::new($ConnectionString)
                $connection.Open()
        
                try {
                    $command = $connection.CreateCommand()
                    $command.CommandType = [System.Data.CommandType]::StoredProcedure
                    $command.CommandText = $StoredProcedure
        
                    $parameter = $command.Parameters.Add("@User_Name", [System.Data.SqlDbType]::NVarChar, 50)
                    $parameter.Value = if ($Username) { 
                        $Username 
                    }
                    else { 
                        [DBNull]::Value 
                    }
                    
        
                    $reader = $command.ExecuteReader()
                    $results = [System.Collections.Generic.List[pscustomobject]]::new()
        
                    while ($reader.Read()) {
                        $row = @{}
                        for ($i = 0; $i -lt $reader.FieldCount; $i++) {
                            $column = $reader.GetName($i)
                            $exclude = @('Password_Bytes', 'Salt_Bytes')
                            if ($column -notin $exclude) {
                                $row[$column] = $reader.GetValue($i)
                            }                
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