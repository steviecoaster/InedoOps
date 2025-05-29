---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# Get-ProGetConnector

## SYNOPSIS
Retrieves information about connectors in ProGet.

## SYNTAX

```
Get-ProGetConnector [[-Name] <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The \`Get-ProGetConnector\` function retrieves details about one or more connectors in ProGet.
If a connector name is provided, it retrieves information for that specific connector.
If no name is provided, it lists all connectors.

## EXAMPLES

### EXAMPLE 1
```
Get-ProGetConnector
```

Retrieves a list of all connectors in ProGet.

### EXAMPLE 2
```
Get-ProGetConnector -Name "MyConnector"
```

Retrieves details about the connector named "MyConnector".

## PARAMETERS

### -Name
The name of the connector to retrieve.
If not specified, all connectors are listed.

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
