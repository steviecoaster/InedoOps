---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# New-ProGetUser

## SYNOPSIS
Create a new ProGet user

## SYNTAX

```
New-ProGetUser [-Credential] <PSCredential> [-DisplayName] <String> [[-EmailAddress] <String>]
 [-Group] <String[]> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Create a new ProGet user with the provided properties

## EXAMPLES

### EXAMPLE 1
```
New-ProGetUser -Credential (Get-Credential) -DisplayName 'Bobby Tables' -Group Users,Chocolatey
```

### EXAMPLE 2
```
New-ProGetUser -Credential $cred -DisplayName 'Jim Thome' -EmailAddress jim@fabrikam.com -Group Administrators
```

## PARAMETERS

### -Credential
The credential object will set the username and password for the user

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -DisplayName
The friendly name of the user account

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -EmailAddress
The email address

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Group
Any groups the user should be included in

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
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
