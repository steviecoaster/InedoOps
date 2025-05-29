---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# Get-ProGetConfiguration

## SYNOPSIS
Retrieves the configuration for connecting to ProGet.

## SYNTAX

```
Get-ProGetConfiguration [[-Configuration] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The \`Get-ProGetConfiguration\` function retrieves the configuration for ProGet.
By default, it retrieves the configuration for ProGet unless a different configuration name is provided.

## EXAMPLES

### EXAMPLE 1
```
Get-ProGetConfiguration
```

Retrieves the configuration for ProGet.

### EXAMPLE 2
```
Get-ProGetConfiguration -Configuration "CustomConfig"
```

Retrieves the configuration for the configuration named "CustomConfige".

## PARAMETERS

### -Configuration
The name of the configuration to retrieve.
Defaults to 'ProGet'.

```yaml
Type: String
Parameter Sets: (All)
Aliases: Name

Required: False
Position: 1
Default value: ProGet
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
