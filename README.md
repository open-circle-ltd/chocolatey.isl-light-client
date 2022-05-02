# Chocolatey Package: ISL Light Client

## Description

Receive remote desktop support from the help desk operator.

## Package installation defaults

By default, **installation** of this package:

- Will install ISL Light Client with a Shortcut on the Desktop called ISL Light Client

## Package Parameters

- `/InstallDir` - You can pass the Installation Path
- `/DesktopShortcutName` - You can pass the Name for the Shortcut on The Desktop
- `/NoDesktopShortcut` - Do not create Desktop Shortcut

## Installation

Installation without parameters.

```ps1
choco install isl-light-client
```

Installation with parameters.

```powershell
choco install isl-light-client --params '/InstallDir:C:\User\USERNAME\Package /DesktopShortcut:Name Support'
```
```powershell
choco install isl-light-client --params '/NoDesktopShortcut'
```

## Note

This Package doesn't use checksums because it changes every time the installer is downloaded.

## Author

- [Benaiah Matthew Catherasoo](https://github.com/bmcatherasoo)
- [Open Circle AG](https://www.open-circle.ch/)



## Copyright

&copy; 2022, Open Circle AG
