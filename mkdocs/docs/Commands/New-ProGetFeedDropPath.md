---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# New-ProGetFeedDropPath

## SYNOPSIS
Creates or updates the drop path for a ProGet feed.

## SYNTAX

```
New-ProGetFeedDropPath [-Feed] <String> [[-DropPath] <String>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
The \`New-ProGetFeedDropPath\` function allows you to set or update the drop path for a specified ProGet feed. 
The drop path is used to specify a directory where packages can be dropped for processing by the feed.

## EXAMPLES

### EXAMPLE 1
```
New-ProGetFeedDropPath -Feed "MyFeed" -DropPath "C:\Packages\Drop"
```

Sets the drop path for the feed "MyFeed" to "C:\Packages\Drop".

### EXAMPLE 2
```
New-ProGetFeedDropPath -Feed "MyFeed"
```

Drop Path will default to C:\Drop\MyFeed.

## PARAMETERS

### -Feed
The name of the feed for which the drop path is being set.
This parameter is mandatory.

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

### -DropPath
The directory path to set as the drop path for the feed.
If not specified, the drop path will be cleared.

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
