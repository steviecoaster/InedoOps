---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# Get-ProGetFeed

## SYNOPSIS
Returns information about the available feeds in your ProGet instance

## SYNTAX

```
Get-ProGetFeed [[-Feed] <String>] [[-Type] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Supports returning all feeds, feeds by type, or by name

## EXAMPLES

### EXAMPLE 1
```
Get-ProGetFeed
```

Return all feeds

### EXAMPLE 2
```
Get-ProGetFeed -Type nuget
```

Return all nuget feeds

### EXAMPLE 3
```
Get-ProGetFeed -Feed ChocolateyPackages
```

Return the ChocolateyPackages feed

## PARAMETERS

### -Feed
The feed to return

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Type
The type of feed to return

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
