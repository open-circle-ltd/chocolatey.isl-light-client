$ErrorActionPreference = 'Stop'
$pp = Get-PackageParameters
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$urlPackage = 'https://cdn.jsdelivr.net/gh/open-circle-ltd/chocolatey.isl-light-client@master/exe/isl_light_client.exe'
$checksumPackage = '00DE5F62110BAB4AC19E5709289D9BD8FD7A979B87BD4A516497059829D62513D00798CF118DFC21873A42C33A701921D2483338F3C032FA9778E7F31291E0C3'

$sa = ""
$sa += if ($pp.InstallDir) {$filefullpath = $pp.InstallDir + '\' + $Softwarename}
else {$filefullpath = ("$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\" + $Softwarename)}

$sa += if ($pp.DesktopShortcutName) {$DesktopShortcut = $pp.DesktopShortcutName}
else {$DesktopShortcut = 'ISL Light Client'}

$ShortcutFilePath = ('C:\Users\Public\Desktop\' + $DesktopShortcut + '.lnk')

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'EXE'
  url           = $urlPackage
  softwareName  = 'isl-light-client*'
  checksum      = $checksumPackage
  checksumType  = 'sha512'
  silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
}

$shortcutArgs = @{
    ShortcutFilePath = $ShortcutFilePath
    TargetPath       = $filefullpath
  }
  
  if ($pp.NoDesktopShortcut){
    Get-ChocolateyWebFile @packageArgs
  }
  elseif ($pp.DesktopShortcutName) {
    Get-ChocolateyWebFile @packageArgs
    Install-ChocolateyShortcut @shortcutArgs
  }
  else {
    Get-ChocolateyWebFile @packageArgs
  }
  
  @{'filepath'=$filefullpath; 'ShortcutPath'=$ShortcutFilePath } | ConvertTo-Json | Out-File "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\path.json"