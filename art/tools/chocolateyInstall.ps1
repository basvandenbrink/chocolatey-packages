$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'art'
  fileType       = 'exe'
  softwareName   = 'ART'

  checksum64       = 'aaa615e53f596152f8011cd7d9975e2a505223300b585e9f24449adb18f6b481'
  checksumType64   = 'sha256'
  url64            = 'https://github.com/artpixls/ART/releases/download/1.25.10/ART_1.25.10_Win64.exe'

  silentArgs     = '/verysilent /allusers'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
