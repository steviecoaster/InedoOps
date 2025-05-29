# Pagootle : Manage Inedo ProGet with PowerShell (Formerly InedoOps)

_Wait....why Pagootle? That's so odd!_

Inedo has a command-line utility, `pgutil.exe`, which can be used to help administer Inedo ProGet. This PowerShell module is named after their [favorite pronunciation](https://docs.inedo.com/docs/proget/api/pgutil#how-is-pgutil-pronounced) of that tool! `InedoOps` sounded too much like "I need oops" in my head, and I just couldnt't handle it.

## What's Included?

This PowerShell modules allows an administrator the ability to manage an Inedo ProGet instance through the use of PowerShell.
Currently this module provides the following capabilities:

- `Get-ProGetConfiguration`
- `Get-ProGetConnector`
- `Get-ProGetFeed`
- `Get-ProGetTask`
- `Get-ProGetUser`
- `Merge-Directory`
- `New-ProGetAsset`
- `New-ProGetConnector`
- `New-ProGetFeed`
- `New-ProGetFeedDropPath`
- `New-ProGetGroup`
- `New-ProGetUser`
- `Publish-ProGetAsset`
- `Remove-ProGetConnector`
- `Remove-ProGetFeed`
- `Set-ProGetConfiguration`
- `Set-ProGetSslConfig`
- `Set-ProGetUserPassword`

## Installation

### From Source

You can build this module from source. Doing so will require the ModuleBuilder module from the PowerShell Gallery

```powershell
Install-PSResource ModuleBuilder -Scope CurrentUser
git clone https://github.com/steviecoaster/Pagootle.git
cd Pagootle
. .\Build.ps1 # Use -Semver to define a custom version
Import-Module .\0.0.1\Pagootle.psd1 # Or whatever version you specified during build script execution
```

### Install through the PowerShell Gallery

#### PowerShell 7+

```powershell
Install-PSResource Pagootle -Scope CurrentUser
```

### Chocolatey (COMING SOON)

```powershell
choco install Pagootle -y -s https://community.chocolatey.org/api/v2
```

## Getting Started

### Setting Configuration

This module uses the PowerShell `Configuration` module to store the configuration the module will use to connect to your ProGet instance.

An example of this is:

`Set-ProGetConfiguration -Name ProGet -Hostname proget.steviecoaster.dev -Credential (Get-Credential) -UseSSL -SslPort 443`

This example:

- Names the configuration `ProGet`
- Hostname is the hostname of your ProGet instance
- Credential is a PSCredential object. _Currently only supports API key auth, use anything for username, and your api key for the password_
- -UseSSL stores the web uri as https://
- SslPort is the SSL port your instance uses

Once you have configuration set, you can begin to use all the features of this module