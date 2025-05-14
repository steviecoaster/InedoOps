function Set-ProGetServerLicense {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]
        $LicenseKey
    )

    end {

        $params = @{
            Slug = '/administration/licensing/change-license-key'
            Form = @{ License = $LicenseKey}
            Method = 'POST'
        }

        Invoke-ProGet @params
    }
}