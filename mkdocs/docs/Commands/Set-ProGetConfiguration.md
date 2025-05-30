---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# Set-ProGetConfiguration

## SYNOPSIS
Sets the configuration for connecting to ProGet.

## SYNTAX

### Apikey (Default)
```
Set-ProGetConfiguration -Hostname <String> [-NonSslPort <Int32>] [-UseSSL] [-SslPort <Int32>] [-Name <String>]
 -ApiKey <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Both
```
Set-ProGetConfiguration -Hostname <String> -Credential <PSCredential> [-NonSslPort <Int32>] [-UseSSL]
 [-SslPort <Int32>] [-Name <String>] -ApiKey <String> [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### Credential
```
Set-ProGetConfiguration -Hostname <String> -Credential <PSCredential> [-NonSslPort <Int32>] [-UseSSL]
 [-SslPort <Int32>] [-Name <String>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The \`Set-ProGetConfiguration\` function allows you to configure the connection settings for ProGet, including hostname, credentials, ports, and SSL options.
The configuration can be saved with a custom name for later use.

## EXAMPLES

### EXAMPLE 1
```
Set-ProGetConfiguration -Hostname "proget.example.com" -Credential (Get-Credential)
```

Sets the configuration for ProGet with the specified hostname and credentials.

### EXAMPLE 2
```
Set-ProGetConfiguration -Hostname "proget.example.com" -ApiKey asdf8675309
```

Sets the configuration for ProGet with the specified hostname and apikey

### EXAMPLE 3
```
Set-ProGetConfiguration -Hostname "proget.example.com" -ApiKey asdf8675309 -Credential (Get-Credential)
```

Sets the configuration for ProGet with the specified hostname, credential, and apikey

### EXAMPLE 4
```
Set-ProGetConfiguration -Hostname "proget.example.com" -Credential (Get-Credential) -UseSSL -SslPort 8443
```

Sets the configuration for ProGet with SSL enabled and a custom SSL port.

### EXAMPLE 5
```
Set-ProGetConfiguration -Hostname "proget.example.com" -Credential (Get-Credential) -Name "CustomConfig"
```

Sets the configuration for ProGet with a custom configuration name.

## PARAMETERS

### -Hostname
The hostname of the ProGet server.
This parameter is mandatory.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
A PSCredential object containing the username and password for authenticating with the ProGet server.
This parameter is mandatory.

```yaml
Type: PSCredential
Parameter Sets: Both, Credential
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NonSslPort
The port to use for non-SSL connections.
Defaults to 8624.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 8624
Accept pipeline input: False
Accept wildcard characters: False
```

### -UseSSL
Specifies whether to use SSL for the connection.
This parameter is part of the 'ssl' parameter set.

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

### -SslPort
The port to use for SSL connections.
Defaults to 443.
This parameter is mandatory when \`UseSSL\` is specified.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 443
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
The name of the configuration to save.
Defaults to 'ProGet'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: ProGet
Accept pipeline input: False
Accept wildcard characters: False
```

### -ApiKey
The API key to use for authentication.
Defaults to 'SetMe'.

```yaml
Type: String
Parameter Sets: Apikey, Both
Aliases:

Required: True
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
