function New-ProGetAsset {
    <#
        .Synopsis
        Transfers a file to a ProGet asset directory.
        .Description
        Transfers a file to a ProGet asset directory. This function performs automatic chunking
        if the file is larger than a specified threshold.
        .Parameter FileName
        Name of the file to upload from the local file system.
        .Parameter EndpointUrl
        Full URL of the ProGet asset directory's API endpoint. This is typically something like http://proget/endpoints/<directoryname>
        .Parameter AssetName
        Full path of the asset to create in ProGet's asset directory.
        .Parameter ChunkSize
        Uploads larger than this value will be uploaded using multiple requests. The default is 5 MB.
        .Example
        New-ProGetAsset -FileName C:\Files\Image.jpg -AssetName images/image.jpg -EndpointUrl http://proget/endpoints/MyAssetDir
    #>
    param(
        [Parameter(Mandatory = $true)]
        [string]
        $fileName,

        [Parameter()]
        [String]
        $AssetDirectory,

        [Parameter()]
        [string]
        $Slug = '/endpoints/{0}' -f $AssetDirectory,

        [Parameter(Mandatory = $true)]
        [string]
        $assetName,

        [Parameter()]
        [int]
        $chunkSize = 5 * 1024 * 1024
    )

    begin {
        $Configuration = Get-ProGetConfiguration

        $ssl = if ($Configuration['UseSSL']) {
            'https'
        }
        else {
            'http'
        }

    }

    process {

        $endpointUrl = "$($ssl)://$($Configuration['Hostname']):8443"
        if (-not $endpointUrl.EndsWith('/')) { $endpointUrl += '/' }
        $targetUrl = $endpointUrl + 'content/' + "$AssetDirectory/" + [Uri]::EscapeUriString($assetName.Replace('\', '/'))
        Write-Verbose $targetUrl
        $fileInfo = Get-ChildItem -Path $fileName

        if ($fileInfo.Length -le $chunkSize) {
            Invoke-WebRequest -Method Post -Uri $targetUrl -InFile $fileName
        }
        else {
            $sourceStream = [System.IO.FileStream]::new($fileName, [System.IO.FileMode]::Open, [System.IO.FileAccess]::Read, [System.IO.FileShare]::Read, 4096, [System.IO.FileOptions]::SequentialScan)

            try {
                $fileLength = $sourceStream.Length
                $remainder = 0
                $totalParts = [Math]::DivRem($fileLength, $chunkSize, [ref]$remainder)
                if ($remainder -ne 0) { $totalParts++ }
                $uuid = [Guid]::NewGuid().ToString("N")

                0..($totalParts - 1) | ForEach-Object {
                    $index = $_
                    $offset = $index * $chunkSize
                    $currentChunkSize = if ($index -eq ($totalParts - 1)) { $fileLength - $offset } else { $chunkSize }

                    $req = [System.Net.WebRequest]::CreateHttp("${targetUrl}?multipart=upload&id=$uuid&index=$index&offset=$offset&totalSize=$fileLength&partSize=$currentChunkSize&totalParts=$totalParts")
                    $req.Method = 'POST'
                    $req.ContentLength = $currentChunkSize
                    $req.AllowWriteStreamBuffering = $false
                    $reqStream = $req.GetRequestStream()

                    try { CopyMaxBytes -source $sourceStream -target $reqStream -maxBytes $currentChunkSize -startOffset $offset -totalSize $fileLength }
                    finally { if ($reqStream) { $reqStream.Dispose() } }

                    $response = $req.GetResponse()
                    try { } finally { if ($response) { $response.Dispose() } }
                }

                Write-Progress -Activity "Uploading $fileName..." -Status "Completing upload..." -PercentComplete -1

                $req = [System.Net.WebRequest]::CreateHttp("${targetUrl}?multipart=complete&id=$uuid")
                $req.Method = 'POST'
                $req.ContentLength = 0
                $response = $req.GetResponse()
                try { } finally { if ($response) { $response.Dispose() } }
            }
            finally { if ($sourceStream) { $sourceStream.Dispose() } }
        }
    }
}