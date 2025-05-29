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
        [ValidateSet('Read', 'ReadExecute', 'Modify', 'FullControl')]
        [String]
        $Permissions
    )

    begin {
        $caller = (Get-PSCallStack)[1].Command
    }

    end {
        $acl = Get-Acl $FilePath
        $inheritanceFlags = [System.Security.AccessControl.InheritanceFlags]::ContainerInherit -bor [System.Security.AccessControl.InheritanceFlags]::ObjectInherit
        $PermissionSet = @{
            Read        = [System.Security.AccessControl.FileSystemRights]::Read
            ReadExecute = [System.Security.AccessControl.FileSystemRights]::ReadAndExecute
            Modify      = [System.Security.AccessControl.FileSystemRights]::Modify
            FullControl = [System.Security.AccessControl.FileSystemRights]::FullControl

        }

        if ($caller -eq 'Set-CertPermissions') {
            # Grant ProGet service user read access to the private key
            $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
                $ServiceUser, # User
                $PermissionSet[$Permissions], # Permissions
                "Allow"
            )
        } 
        else {
            $accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule(
                $ServiceUser, # User
                $PermissionSet[$Permissions], # Permissions
                $inheritanceFlags, # Inheritance
                [System.Security.AccessControl.PropagationFlags]::None, #Apply normal inheritance
                "Allow"
            )
        }

        $acl.SetAccessRule($accessRule)
        Set-Acl -Path $FilePath -AclObject $acl
    }
}