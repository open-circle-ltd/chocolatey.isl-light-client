$ErrorActionPreference = 'Stop';

(Get-Content -Raw -Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\desktopshortcut.json" | ConvertFrom-Json).PSObject.Properties | ForEach-Object {
    Remove-Item "$($_.Value)"
}