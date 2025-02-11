function Invoke-CreateGroupStoredProc {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Name
    )

    end {

        $connectionString = Get-ProGetConnectionString

        # Define the stored procedure and parameters
        $storedProc = "dbo.Users_CreateGroup"
        $groupName = $Name

        # Create and open SQL connection
        $sqlConnection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
        $sqlConnection.Open()

        # Create SqlCommand and specify it as a stored procedure
        $sqlCommand = $sqlConnection.CreateCommand()
        $sqlCommand.CommandText = $storedProc
        $sqlCommand.CommandType = [System.Data.CommandType]::StoredProcedure

        # Add parameter
        $sqlCommand.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Group_Name", [System.Data.SqlDbType]::NVarChar, 50))).Value = $groupName

        # Execute the SqlCommand
        $sqlCommand.ExecuteNonQuery()

        # Close the connection
        $sqlConnection.Close()

        Write-Host "Group added successfully to ProGet."

    }
}