function Get-ProGetConnector {
    [CmdletBinding()]
    Param(
        [Parameter()]
        [String]
        $Name
    )

    process{
        $params = @{
            Method = 'GET'
        }

        if($Name){
            $params.add('Slug',"/api/management/connectors/get/$Name")
        }
        else {
            $params.Add('Slug','/api/management/connectors/list')
        }

        Invoke-ProGet @params
    }
}