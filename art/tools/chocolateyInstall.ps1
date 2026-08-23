$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'art'
  fileType       = 'exe'
  softwareName   = 'ART'

  checksum64       = '516302f5959cff44d2a51b09442aa5f5b07db1ea058e3be31ac9c04a9cb872e0'
  checksumType64   = 'sha256'
  url64            = 'https://github.com/artraweditor/ART/releases/download/1.26.8/ART_1.26.8_Win64.exe'

  silentArgs     = '/verysilent /allusers'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
