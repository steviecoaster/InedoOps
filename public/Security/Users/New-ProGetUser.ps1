function New-ProGetUser {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [System.Management.Automation.PSCredential]
        $Credential,

        [Parameter(Mandatory)]
        [Alias('FullName')]
        [String]
        $DisplayName,

        [Parameter()]
        [String]
        $EmailAddress,

        [Parameter()]
        [String[]]
        $Groups
    )

    end {
        $body = @{
            User_Name = $Credential.UserName
            Display_Name = $DisplayName
            Email_Address = $EmailAddress
            Groups_Xml = $Groups
        }

        $Params = @{
            Slug = '/api/json/Users_CreateOrUpdateUser'
            Method = 'POST'
            Body = $body
        }

        Invoke-ProGet @Params
    }
}