---
external help file: Pagootle-help.xml
Module Name: Pagootle
online version:
schema: 2.0.0
---

# New-ProGetFeed

## SYNOPSIS
Creates a new feed in ProGet.

## SYNTAX

```
New-ProGetFeed [-Name] <String> [[-AlternateNames] <String>] [[-Type] <String>] [-Active] [-CacheConnectors]
 [-SymbolServerEnabled] [-StripSymbols] [-StripSource] [[-EndpointUrl] <String>] [[-Connectors] <String[]>]
 [[-RetentionRules] <String[]>] [[-Variables] <Hashtable>] [-CanPublish] [-PackageStatisticsEnabled]
 [-RestrictPackageStatistics] [-DeploymentRecordsEnabled] [-UsageRecordsEnabled] [-VulnerabilitiesEnabled]
 [-LicensesEnabled] [-UseWithProjects] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
The \`New-ProGetFeed\` function allows you to create a new feed in ProGet with various configurable options, such as feed type, connectors, retention rules, and more.
It supports multiple feed types, including NuGet, Chocolatey, Docker, and others.

## EXAMPLES

### EXAMPLE 1
```
New-ProGetFeed -Name "MyFeed" -Type "nuget" -Active -CanPublish
```

Creates a new NuGet feed named "MyFeed" that is active and allows publishing.

### EXAMPLE 2
```
New-ProGetFeed -Name "DockerFeed" -Type "docker" -Connectors @("Connector1", "Connector2") -RetentionRules @("Rule1", "Rule2")
```

Creates a new Docker feed named "DockerFeed" with specified connectors and retention rules.

## PARAMETERS

### -Name
The name of the feed to create.
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

### -AlternateNames
Alternate names for the feed.

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

### -Type
The type of the feed.
Supported types include 'asset', 'bower', 'conda', 'chocolatey', 'debianlegacy', 'debian', 'docker', 'helm', 'maven', 'npm', 'nuget', 'powershell', 'universal', 'pypi', 'romp', 'rpm', 'rubygems', and 'vsix'.
Defaults to 'NuGet'.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: NuGet
Accept pipeline input: False
Accept wildcard characters: False
```

### -Active
Specifies whether the feed is active.

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

### -CacheConnectors
Specifies whether connectors should be cached.

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

### -SymbolServerEnabled
Enables the symbol server for the feed.

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

### -StripSymbols
Specifies whether symbols should be stripped from packages.

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

### -StripSource
Specifies whether source files should be stripped from packages.

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

### -EndpointUrl
The endpoint URL for the feed.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Connectors
A list of connectors to associate with the feed.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: 5
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RetentionRules
A list of retention rules to apply to the feed.

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

### -Variables
A hashtable of variables to associate with the feed.

```yaml
Type: Hashtable
Parameter Sets: (All)
Aliases:

Required: False
Position: 7
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CanPublish
Specifies whether publishing to the feed is allowed.

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

### -PackageStatisticsEnabled
Enables package statistics for the feed.

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

### -RestrictPackageStatistics
Restricts access to package statistics.

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

### -DeploymentRecordsEnabled
Enables deployment records for the feed.

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

### -UsageRecordsEnabled
Enables usage records for the feed.

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

### -VulnerabilitiesEnabled
Enables vulnerability tracking for the feed.

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

### -LicensesEnabled
Enables license tracking for the feed.

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

### -UseWithProjects
Specifies whether the feed can be used with projects.

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
