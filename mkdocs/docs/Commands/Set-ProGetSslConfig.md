---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# Set-ProGetSslConfig

## SYNOPSIS
Updates the ProGet configuration file and restarts the ProGet services.

## SYNTAX

### Pfx
```
Set-ProGetSslConfig [-ConfigFile <String>] -CertFile <String> [-CertPassword <SecureString>] [-Urls <String[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### CertFile
```
Set-ProGetSslConfig [-ConfigFile <String>] -CertFile <String> [-KeyFile <String>] [-Urls <String[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

### WindowsStore
```
Set-ProGetSslConfig [-ConfigFile <String>] -Location <String> -Store <String> -Subject <String> [-AllowInvalid]
 [-Urls <String[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
This script updates the ProGet configuration file with specified parameters, handles SSL certificate settings, and restarts the ProGet services.
It processes parameters, updates the XML configuration file, and ensures the correct attributes are set.

## EXAMPLES

### EXAMPLE 1
```
Set-ProGetSslConfig -Location 'Machine' -Store 'My' -Subject 'example.com' -AllowInvalid -CertPassword 'password' -Urls 'http://*:8624/'
```

This command updates the ProGet configuration to use a certificate with the subject 'example.com' from the specified Windows certificate store.

### EXAMPLE 2
```
Set-ProGetSslConfig -CertFile "C:\proget_cert\cert.pfx" -CertPassword ('poshacme' | ConvertTo-SecureString -AsPlainText -Force) -Urls http://*:8624/,https://*:8443/
```

Updates ProGet configuration to use the provided pfx file and pfx password to secure the ProGet instance.
Also allows for non-http binding to port 8624

### EXAMPLE 3
```
Set-ProGetSslConfig -CertFile "C:\proget_cert\cert.pem" -KeyFile "C:\proget_cert\cert.key" -Urls http://*:8624/,https://*:8443/
```

Updates ProGet configuration to use the provided pem and key file to secure the ProGet instance with SSL

## PARAMETERS

### -ConfigFile
Specifies the path to the ProGet configuration file.
Default is 'C:\ProgramData\Inedo\SharedConfig\ProGet.config'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: C:\ProgramData\Inedo\SharedConfig\ProGet.config
Accept pipeline input: False
Accept wildcard characters: False
```

### -Location
Specifies the location of the certificate store.
Valid values are 'User' and 'LocalMachine'.

```yaml
Type: String
Parameter Sets: WindowsStore
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Store
Specifies the certificate store.
Valid values are 'My', and 'Root'.

```yaml
Type: String
Parameter Sets: WindowsStore
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Subject
Specifies the subject name of the certificate.

```yaml
Type: String
Parameter Sets: WindowsStore
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -AllowInvalid
A switch parameter that allows invalid certificates if specified.

```yaml
Type: SwitchParameter
Parameter Sets: WindowsStore
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertFile
{{ Fill CertFile Description }}

```yaml
Type: String
Parameter Sets: Pfx, CertFile
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CertPassword
Specifies the password for the certificate.

```yaml
Type: SecureString
Parameter Sets: Pfx
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -KeyFile
{{ Fill KeyFile Description }}

```yaml
Type: String
Parameter Sets: CertFile
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Urls
Specifies the URLs for the web server to bind too.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Http://*:8624/
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
