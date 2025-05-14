# InedoOps : Manage Inedo ProGet with PowerShell

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
Install-Module ModuleBuilder -Scope CurrentUser
git clone https://github.com/steviecoaster/InedoOps.git
cd InedoOps
. .\Build.ps1
Import-Module .\InedoOps\0.0.1\InedoOps.psd1
```

### Install through the PowerShell Gallery

#### Windows PowerShell (COMING SOON)

```powershell
Install-Module InedoOps -Scope CurrentUser
```

#### PowerShell 7+ (COMING SOON)

```powershell
Install-PSResource InedoOps -Scope CurrentUser
```

### Chocolatey (COMING SOON)

```powershell
choco install inedoops -y -s https://community.chocolatey.org/api/v2
```

## Getting Started

This module uses the PowerShell `Configuration` module to store the configuration
for connecting to your Inedo ProGet instance. An example of this is:

`Set-ProGetConfiguration -Name ProGet -Hostname proget.steviecoaster.dev -Credential (Get-Credential) -UseSSL -SslPort 443`

This example:

- Names the configuration `ProGet`
- Hostname is the hostname of your ProGet instance
- Credential is a PSCredential object. _Currently only supports API key auth, use anything for username, and your api key for the password_
- -UseSSL stores the web uri as https://
- SslPort is the SSL port your instance uses

Once you have your configuration created, you can begin to use the functions available in the module.