function Publish-ProGetAsset {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Feed,

        [Parameter(Mandatory)]
        [String[]]
        $File
    )
    end {

        foreach ($F in $File) {
            $params = @{
                Slug   = "/endpoints/$Feed/content/{0}" -f (Split-Path $F -Leaf)
                Method = 'PUT'
                File   = $F
            }

            Invoke-ProGet @params
        }
    }
}