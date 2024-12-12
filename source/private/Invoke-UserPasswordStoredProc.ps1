function Invoke-UserPasswordStoredProc {
    <#
        .SYNOPSIS
        Private function that executes dbo.Users_SetPassword stored procedure in ProGet Database
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [Hashtable]        
        $Params,
        
        [Parameter(DontShow)]
        [String]
        $ConnectionString = 'Server=Localhost\SQLEXPRESS;Database=ProGet;Trusted_Connection=true;'
    )

    end {
        $StoredProcedure = 'dbo.Users_SetPassword'
        if ($UseRemoting) {
            # Execute on a remote machine using PowerShell remoting
            $scriptBlock = {
                param ($ConnectionString, $StoredProcedure, $Params)
      
                Add-Type -AssemblyName "System.Data"
      
                $connection = New-Object System.Data.SqlClient.SqlConnection
                $connection.ConnectionString = $ConnectionString
                $connection.Open()
      
                try {
                    $command = $connection.CreateCommand()
                    $command.CommandType = [System.Data.CommandType]::StoredProcedure
                    $command.CommandText = $StoredProcedure
                    $command.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@User_Name", [Data.SqlDbType]::NVarChar, 50))).Value = $Params['User_Name']
                    $command.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Password_Bytes", [Data.SqlDbType]::Binary, 20))).Value = $Params['Password_Bytes']
                    $command.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Salt_Bytes", [Data.SqlDbType]::Binary, 10))).Value = $Params['Salt_Bytes']
      
                    $null = $command.ExecuteNonQuery()
                }
                catch {
                    Write-Error "An error occurred: $_"
                }
                finally {
                    $connection.Close()
                }
            }
      
            if ($Credential) {
                Invoke-Command -ComputerName $RemoteComputer -Credential $Credential -ScriptBlock $scriptBlock -ArgumentList $ConnectionString, $StoredProcedure, $Params
            }
            else {
                Invoke-Command -ComputerName $RemoteComputer -ScriptBlock $scriptBlock -ArgumentList $ConnectionString, $StoredProcedure, $Params
            }
        }
      
        else {
            # Execute locally
            Add-Type -AssemblyName "System.Data"
      
            $connection = New-Object System.Data.SqlClient.SqlConnection
            $connection.ConnectionString = $ConnectionString
            $connection.Open()
      
            try {
                $command = $connection.CreateCommand()
                $command.CommandType = [System.Data.CommandType]::StoredProcedure
                $command.CommandText = $StoredProcedure
      
                $command.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@User_Name", [Data.SqlDbType]::NVarChar, 50))).Value =  $Params['User_Name']
                $command.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Password_Bytes", [Data.SqlDbType]::Binary, 20))).Value = $Params['Password_Bytes']
                $command.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Salt_Bytes", [Data.SqlDbType]::Binary, 10))).Value = $Params['Salt_Bytes']
  
                $null = $command.ExecuteNonQuery()
            }
            catch {
                Write-Error "An error occurred: $_"
            }
            finally {
                $connection.Close()
            }
        }
    }

}