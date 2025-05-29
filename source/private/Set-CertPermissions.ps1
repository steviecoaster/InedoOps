function Set-CertPermissions {
    <#
    .SYNOPSIS
    Sets the permissions on the private key for a given certificate
    
    .DESCRIPTION
    Long description
    
    .PARAMETER Thumbprint
    Parameter description
    
    .PARAMETER Location
    Parameter description
    
    .PARAMETER Store
    Parameter description
    
    .PARAMETER ServiceUser
    Parameter description
    
    .EXAMPLE
    An example
    
    .NOTES
    General notes
    #>
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Thumbprint,

        [Parameter(Mandatory)]
        [String]
        $Location,
  
        [Parameter(Mandatory)]
        [String]
        $Store,

        [Parameter(Mandatory)]
        [String]
        $ServiceUser

    )
    end {

        # Load the certificate from the specified store
        $certStore = New-Object System.Security.Cryptography.X509Certificates.X509Store $Store, $Location
        $certStore.Open("ReadOnly")
        $certificate = $certStore.Certificates | Where-Object { $_.Thumbprint -eq $thumbprint }

        if (-not $certificate) {
            Write-Error "Certificate with thumbprint $thumbprint not found in LocalMachine\My."
            $certStore.Close()
            return
        }

        # Get the private key file path
        $privateKey = $certificate.PrivateKey.CspKeyContainerInfo
        if ($privateKey.MachineKeyStore -and $privateKey.UniqueKeyContainerName) {
            $keyPath = Join-Path $env:ProgramData "Microsoft\Crypto\RSA\MachineKeys\$($privateKey.UniqueKeyContainerName)"
            # Close the certificate store
            $certStore.Close()
        }
        else {
            Write-Error "Unable to locate the private key for the certificate."
            $certStore.Close()
            return
        }
        # Grant NETWORK SERVICE read access to the private key
        $ServiceUser = (Get-CimInstance Win32_Service -Filter "Name = 'INEDOPROGETWEBSVC'").StartName
        Set-ServiceUserPermission -FilePath $keyPath -ServiceUser $ServiceUser -Permissions Read
    }
}