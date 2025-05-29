---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# New-ProGetAsset

## SYNOPSIS
Transfers a file to a ProGet asset directory.

## SYNTAX

```
New-ProGetAsset [-fileName] <String> [[-AssetDirectory] <String>] [[-Slug] <String>] [-assetName] <String>
 [[-chunkSize] <Int32>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Transfers a file to a ProGet asset directory.
This function performs automatic chunking
if the file is larger than a specified threshold.

## EXAMPLES

### EXAMPLE 1
```
New-ProGetAsset -FileName C:\Files\Image.jpg -AssetName images/image.jpg -EndpointUrl http://proget/endpoints/MyAssetDir
```

## PARAMETERS

### -fileName
Name of the file to upload from the local file system.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AssetDirectory
{{ Fill AssetDirectory Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Slug
{{ Fill Slug Description }}

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: '/endpoints/{0}' -f $AssetDirectory
Accept pipeline input: False
Accept wildcard characters: False
```

### -assetName
Full path of the asset to create in ProGet's asset directory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -chunkSize
Uploads larger than this value will be uploaded using multiple requests.
The default is 5 MB.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: 5242880
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES

## RELATED LINKS
