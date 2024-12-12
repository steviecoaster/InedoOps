$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path -Parent $MyInvocation.MyCommand.Definition
$helpers = Join-Path $toolsDir -ChildPath 'helpers.ps1'
$unzipPath = New-Item (Join-Path $toolsDir -ChildPath 'InedoTemp') -ItemType Directory
$hub = Join-Path $toolsDir -ChildPath 'hub.zip'

$pp = Get-PackageParameters

#Load helpers
. $helpers

# Download Offline Installer
$ProGet = Get-ProGetInstaller
$ProGetInstaller = Join-Path $toolsDir -ChildPath (Split-Path -Leaf $ProGet.Downloads)

$webFileArgs = @{
    Packagename  = $env:ChocolateyPackageName
    FileFullPath = $ProGetInstaller
    Url          = $ProGet.Downloads
    Checksum     = '03CD312905CF735DE36B303FF28C63880B1B7AFD4A458D69280EAB88F546BD29'
    checksumType = 'SHA256'
}

Get-ChocolateyWebFile @webFileArgs

# Extract Offline Installer
$unzipArgs = @{
    Packagename  = $env:ChocolateyPackageName
    FileFullPath = $ProGetInstaller
    Destination  = $unzipPath
}

Get-ChocolateyUnzip @unzipArgs

#Copy Hub.exe to extracted directory
$unzipArgs = @{
    Packagename  = $env:ChocolateyPackageName
    FileFullPath = $hub
    Destination  = $unzipPath
}

Get-ChocolateyUnzip @unzipArgs

#Install the sumbitch

#Set the connectionString
$ConnectionString = if ($pp['ConnectionString']) {
    $pp['ConnectionString']
}
else {
    'Data Source=localhost\SQLEXPRESS; Integrated Security=True;'
}

#Set the TargetDir
$ProGetDestination = if ($pp['InstallDir']) {
    $pp['InstallDir']
}
else {
    if (-not (Test-Path (Join-path $env:ProgramFiles -ChildPath 'ProGet'))) {
        $null = New-Item (Join-path $env:ProgramFiles -ChildPath 'ProGet') -ItemType Directory 
    } else {
        Join-Path $env:ProgramFiles -ChildPath 'ProGet'
    }
}

$hubExe = Join-Path $unzipPath -ChildPath 'hub.exe'

$installArgs = @{
    Statements     = @('install', "Proget:$($env:ChocolateyPackageVersion)", "--ConnectionString='$ConnectionString'", "--TargetDirectory='$ProgetDestination'",'--UseIIS=true','UseIntegratedWebServer=false')
    ExeToRun       = $hubExe
    validExitCodes = @(0)
}

Start-ChocolateyProcessAsAdmin @installArgs

#Secure with SSL?