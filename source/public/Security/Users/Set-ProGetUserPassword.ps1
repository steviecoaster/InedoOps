function Set-ProGetUserPassword {
    <#
    .SYNOPSIS
    Sets the password for a ProGet user account
    
    .DESCRIPTION
    Long description
    
    .PARAMETER Credential
    The 
    
    .EXAMPLE
    Set-ProGetUserPassword -Credential (Get-Credential)

    Pass a PSCredential object with the username and new password and the user account will be updated.
    .EXAMPLE
    Set-ProGetUserPassword -Username bob

    Will prompt to enter a new password for the user bob
    
    #>
    [Cmdletbinding()]
    Param(
        [Parameter(Mandatory)]
        [Alias('Username')]
        [PSCredential]
        $Credential
    )



    end {

        $iterations = 10000
        $saltLength = 10
        $hashLength = 20

        $rfc2898 = [System.Security.Cryptography.Rfc2898DeriveBytes]::new($Credential.GetNetworkCredential().Password, $saltLength, $iterations)
        $passwordBytes = $rfc2898.GetBytes($hashLength)
        $saltBytes = $rfc2898.Salt

        $Params = @{
            User_Name      = $Credential.UserName
            Password_Bytes = $passwordBytes
            Salt_Bytes     = $saltBytes
        }

        Invoke-UserPasswordStoredProc -Params $Params
    }
}