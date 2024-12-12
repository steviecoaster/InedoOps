function Invoke-NewUserStoredProc {
  <#
    .SYNOPSIS
    Private function that executes dbo.Users_CreateOrUpdateUser stored procedure in ProGet Database
  #>
  param (
    [Parameter()]
    [string]
    $ConnectionString = 'Server=Localhost\SQLEXPRESS;Database=ProGet;Trusted_Connection=true;',

    [Parameter()]
    [string]
    $StoredProcedure = 'dbo.Users_CreateOrUpdateUser',

    [Parameter(Mandatory)]
    [Hashtable]
    $Params,

    [Parameter()]
    [switch]
    $UseRemoting,

    [Parameter()]
    [string]
    $RemoteComputer,

    [Parameter()]
    [pscredential]
    $Credential
  )

  end {
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

          foreach ($key in $Params.Keys) {
            $command.Parameters.AddWithValue($key, $Params[$key]) | Out-Null
          }

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

        foreach ($key in $Params.Keys) {
          $command.Parameters.AddWithValue($key, $Params[$key]) | Out-Null
        }

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