---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# New-ProGetConnector

## SYNOPSIS
Creates a new connector in ProGet.

## SYNTAX

```
New-ProGetConnector [-Name] <String> [-FeedType] <String> [[-Url] <String>] [-Timeout] <Int32>
 [[-Credential] <PSCredential>] [[-Filters] <String[]>] [-MetadataCacheEnabled]
 [[-MetadataCacheMinutes] <Int32>] [[-MetadataCacheCount] <Int32>] [-ProgressAction <ActionPreference>]
 [<CommonParameters>]
```

## DESCRIPTION
The \`New-ProGetConnector\` function allows you to create a new connector in ProGet.
Connectors are used to link feeds to external sources, such as NuGet, Chocolatey, Docker, and others.
This function supports various feed types and allows configuration of metadata caching, filters, and credentials.

## EXAMPLES

### EXAMPLE 1
```
New-ProGetConnector -Name "NuGetConnector" -FeedType "nuget" -Timeout 60
```

Creates a new NuGet connector named "NuGetConnector" with a timeout of 60 seconds.

### EXAMPLE 2
```
New-ProGetConnector -Name "DockerConnector" -FeedType "docker" -Url "https://custom.docker.registry" -Timeout 120 -Credential (Get-Credential)
```

Creates a new Docker connector named "DockerConnector" with a custom URL, a timeout of 120 seconds, and authentication credentials.

### EXAMPLE 3
```
New-ProGetConnector -Name "FilteredConnector" -FeedType "npm" -Filters @("filter1", "filter2") -MetadataCacheEnabled
```

Creates a new NPM connector named "FilteredConnector" with specified filters and metadata caching enabled.

## PARAMETERS

### -Name
The name of the connector.
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

### -FeedType
The type of feed the connector is associated with.
Supported types include 'universal', 'nuget', 'chocolatey', 'npm', 'maven', 'powershell', 'docker', 'rubygems', 'vsix', 'asset', 'romp', 'pypi', 'helm', 'rpm', 'conda', and 'cran'.
This parameter is mandatory.

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

### -Url
The URL of the external source for the connector.
If not specified, a default URL is used based on the feed type.

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

### -Timeout
The timeout value (in seconds) for the connector.
This parameter is mandatory.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: True
Position: 4
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Credential
A PSCredential object containing the username and password for authentication with the external source.

```yaml
Type: PSCredential
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Filters
An array of filters to apply to the connector.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 6
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MetadataCacheEnabled
Enables metadata caching for the connector.

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

### -MetadataCacheMinutes
Specifies the duration (in minutes) for which metadata is cached.
Defaults to 30 minutes.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: 30
Accept pipeline input: False
Accept wildcard characters: False
```

### -MetadataCacheCount
Specifies the maximum number of metadata items to cache.
Defaults to 100 items.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 8
Default value: 100
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
