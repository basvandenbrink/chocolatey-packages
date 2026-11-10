$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'art'
  fileType       = 'exe'
  softwareName   = 'ART'

  checksum64       = '6f7e664c7b60d5435c9f2d5b0f04f88e80a2413684375b621d5bed81ddcffcd1'
  checksumType64   = 'sha256'
  url64            = 'https://github.com/artraweditor/ART/releases/download/1.26.11/ART_1.26.11_Win64.exe'

  silentArgs     = '/verysilent /allusers'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
