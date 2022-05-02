$ErrorActionPreference = 'Stop';

(Get-Content -Raw -Path "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\path.json" | ConvertFrom-Json).PSObject.Properties | ForEach-Object {
    Remove-Item "$($_.Value)"
}