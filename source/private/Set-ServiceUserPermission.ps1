function Set-ServiceUserPermission {
    [CmdletBinding()]
    Param(
    [Parameter(Mandatory)]
    [String]
    $FilePath,

    [Parameter(Mandatory)]
    [String]
    $ServiceUser,

    [Parameter(Mandatory)]
    [ValidateSet('Read','ReadExecute','Modify','FullControl')]
    [String]
    $Permissions
    )

    end {
        # Grant NETWORK SERVICE read access to the private key
        $acl = Get-Acl $FilePath
        $inheritanceFlags = [System.Security.AccessControl.InheritanceFlags]::ContainerInherit -bor [System.Security.AccessControl.InheritanceFlags]::ObjectInherit
        $PermissionSet = @{
            Read = [System.Security.AccessControl.FileSystemRights]::Read
            ReadExecute = [System.Security.AccessControl.FileSystemRights]::ReadAndExecute
            Modify = [System.Security.AccessControl.FileSystemRights]::Modify
            FullControl = [System.Security.AccessControl.FileSystemRights]::FullControl

        }
        $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
            $ServiceUser, # User
            $PermissionSet[$Permissions], # Permissions
            $inheritanceFlags, # Inheritance
            [System.Security.AccessControl.PropagationFlags]::None, #Apply normal inheritance
            "Allow"
        )

        $acl.SetAccessRule($accessRule)
        Set-Acl -Path $FilePath -AclObject $acl
    }
}