$ErrorActionPreference = 'Stop'
$pp = Get-PackageParameters
$Softwarename = 'ISL_Light_Client.exe'


if ($pp.InstallDir) {
  $filefullpath = $pp.InstallDir + '\' + $Softwarename
}
else {
  $filefullpath = ("$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\" + $Softwarename)
}

if ($pp.DesktopShortcutName) {
  $DesktopShortcut = $pp.DesktopShortcutName
}
else {
  $DesktopShortcut = 'ISL Light Client'
}

$ShortcutFilePath = ('C:\Users\Public\Desktop\' + $DesktopShortcut + '.lnk')


if ($pp.InstallDir) {
    $filepathvariable = (Get-Content -Raw -Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\path.json" | ConvertFrom-Json)
    $filepathvariable.PSObject.Properties.Remove('filepath') 
    $filepathvariable | ConvertTo-Json | Out-File "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\path.json"
    @{ 'filepath'=$filefullpath } | ConvertTo-Json | Out-File "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\path.json"
}

if ($pp.DesktopShortcutName) {
    $shortcutpathvariable = (Get-Content -Raw -Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\path.json" | ConvertFrom-Json)
    $shortcutpathvariable.PSObject.Properties.Remove('shortcutpath') 
    $shortcutpathvariable | ConvertTo-Json | Out-File "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\path.json"
    @{ 'shortcutpath'=$ShortcutFilePath } | ConvertTo-Json | Out-File "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\path.json"
}