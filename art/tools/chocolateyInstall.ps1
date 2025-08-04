$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'art'
  fileType       = 'exe'
  softwareName   = 'ART'

  checksum64       = '5b90ab4a34ef4933de766a3b3bdb5b269ca3dcdf43614ac14817dd1601a64dfe'
  checksumType64   = 'sha256'
  url64            = 'https://github.com/artpixls/ART/releases/download/1.25.8/ART_1.25.8_Win64.exe'

  silentArgs     = '/verysilent /allusers'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
