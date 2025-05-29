---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# Remove-ProGetConnector

## SYNOPSIS
Removes a connector from ProGet.

## SYNTAX

```
Remove-ProGetConnector [-Connector] <String[]> [-Force] [-ProgressAction <ActionPreference>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
The \`Remove-ProGetConnector\` function deletes a specified connector from ProGet.
It supports confirmation prompts to prevent accidental deletions and can be forced to skip confirmation.
The function uses the ProGet API to perform the deletion.

## EXAMPLES

### EXAMPLE 1
```
Remove-ProGetConnector -Connector "MyConnector"
```

Removes the connector named "MyConnector" after confirmation.

### EXAMPLE 2
```
Remove-ProGetConnector -Connector "MyConnector" -Force
```

Forces the removal of the connector named "MyConnector" without confirmation.

### EXAMPLE 3
```
Get-ProGetConnector | Remove-ProGetConnector
```

Pipes the output of \`Get-ProGetConnector\` to remove all listed connectors after confirmation.

## PARAMETERS

### -Connector
The name of the connector(s) to remove.
This parameter is mandatory and supports pipeline input.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Name

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
Skips the confirmation prompt and forces the removal of the connector(s).

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
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
