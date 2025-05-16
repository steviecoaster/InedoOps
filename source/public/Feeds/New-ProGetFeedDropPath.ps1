function New-ProGetFeedDropPath {
    [CmdletBinding()]
    Param(
        [Parameter(Mandatory)]
        [String]
        $Feed,

        [Parameter()]
        [String]
        $DropPath
    )

    $dropArgs = @{
        Feed = $Feed
    }

    if ($DropPath) {
        $dropArgs.Add('DropPath',$DropPath)
    }

    Invoke-NewDropPathStoredProc @dropArgs
}