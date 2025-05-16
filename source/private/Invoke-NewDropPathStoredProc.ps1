function Invoke-NewDropPathStoredProc {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [String]
        $Feed,

        [Parameter()]
        [String]
        $DropPath = 'C:\drop'
    )

    # Define SQL connection parameters
    if (-not $PSBoundParameters.ContainsKey('DropPath')) {
        $DropPath = Join-Path $DropPath -ChildPath $Feed
    }

    if (-not (Test-Path $DropPath)) {
        $null = New-Item $DropPath -ItemType Directory
    }

    # Create SQL query with parameterized stored procedure execution
    $query = @"
DECLARE @Feed_Id INT
SET @Feed_Id = (SELECT Feed_Id FROM Feeds WHERE Feed_Name = @Feed)

EXEC [dbo].[Feeds_SetFeedProperty] 
    @Feed_Id = @Feed_Id,
    @DropPath_Text = @DropPath
"@

    # Define SQL connection
    $connectionString = Get-ProGetConnectionString
    $connection = New-Object System.Data.SqlClient.SqlConnection
    $connection.ConnectionString = $connectionString
    $connection.Open()

    # Create and execute SQL command
    $command = $connection.CreateCommand()
    $command.CommandText = $query
    $null = $command.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@Feed", $Feed)))
    $null = $command.Parameters.Add((New-Object Data.SqlClient.SqlParameter("@DropPath", $DropPath)))
    $null = $command.ExecuteNonQuery()

    # Close connection
    $connection.Close()
}