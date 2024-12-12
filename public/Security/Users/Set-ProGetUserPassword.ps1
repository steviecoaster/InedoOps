function Set-ProGetUserPassword {
    [Cmdletbinding()]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Username,

        [Parameter(Mandatory)]
        [SecureString]
        $OldPassword,

        [Parameter(Mandatory)]
        [SecureString]
        $NewPassword
    )

    begin {
        $confirm = Read-Host "Please re-enter your new password" -AsSecureString

        $identical = Compare-SecureString -SecureString1 $NewPassword -SecureString2 $confirm

        if (-not $identical) {
            Write-Error 'Passwords do not match!'
            break
        }
    }

    end {

        $plainTextPassword = [System.Management.Automation.PSCredential]::new('fake',$NewPassword).GetNetworkCredential().Password
        $iterations = 10000
        $saltLength = 10
        $hashLength = 20

        $rfc2898 = [System.Security.Cryptography.Rfc2898DeriveBytes]::new($plainTextPassword, $saltLength, $iterations)
        $passwordBytes = $rfc2898.GetBytes($hashLength)
        $saltBytes = $rfc2898.Salt

        $base64Password = $passwordBytes
        $base64Salt = $saltBytes

        $body = @{
            User_Name = $Username
            Password_Bytes = $base64Password
            Salt_Bytes = $base64Salt
        }

        Write-Verbose $body

        $Params = @{
            Slug     = '/api/json/Users_SetPassword'
            Method   = 'POST'
            Body = $body
            ContentType = 'application/x-www-form-urlencoded'
        }

        Invoke-ProGet @Params
    }
}