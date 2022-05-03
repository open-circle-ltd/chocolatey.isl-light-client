$ErrorActionPreference = 'Stop'; # stop on all errors
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$pp = Get-PackageParameters

if ($pp.DesktopShortcutName) {$DesktopShortcut = $pp.DesktopShortcutName}
else {$DesktopShortcut = 'ISL Light Client'}

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileType      = 'EXE'
  softwareName  = 'isl-light-client*'
}

$target = Join-Path $toolsDir "$($packageName).exe"
Install-ChocolateyShortcut -shortcutFilePath "C:\Users\Public\Desktop\$DesktopShortcut.lnk" -targetPath "$target"

@{'desktopshortcut'="C:\Users\Public\Desktop\$DesktopShortcut.lnk" } | ConvertTo-Json | Out-File "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\desktopshortcut.json"