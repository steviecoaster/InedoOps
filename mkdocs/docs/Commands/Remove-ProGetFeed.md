---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# Remove-ProGetFeed

## SYNOPSIS
Removes a feed from ProGet.

## SYNTAX

```
Remove-ProGetFeed [-Feed] <String[]> [-Force] [-ProgressAction <ActionPreference>] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
The \`Remove-ProGetFeed\` function deletes a specified feed from ProGet.
It supports pipeline input and provides confirmation prompts to prevent accidental deletions.
The function uses the ProGet API to perform the deletion.

## EXAMPLES

### EXAMPLE 1
```
Remove-ProGetFeed -Feed "MyFeed"
```

Removes the feed named "MyFeed" after confirmation.

### EXAMPLE 2
```
Remove-ProGetFeed -Feed "MyFeed" -Force
```

Forces the removal of the feed named "MyFeed" without confirmation.

### EXAMPLE 3
```
Get-ProGetFeed | Remove-ProGetFeed
```

Pipes the output of \`Get-ProGetFeed\` to remove all listed feeds after confirmation.

## PARAMETERS

### -Feed
The name of the feed(s) to remove.
This parameter is mandatory and supports pipeline input.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases: Name

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Force
Skips the confirmation prompt and forces the removal of the feed(s).

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
