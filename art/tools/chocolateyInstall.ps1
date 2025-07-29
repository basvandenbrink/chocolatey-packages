$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'art'
  fileType       = 'exe'
  softwareName   = 'ART'

  checksum64       = '3221bce8325442057d603477e9d3a317bf26fd43264b4ddef6d87b50834bccc8'
  checksumType64   = 'sha256'
  url64            = 'https://github.com/artpixls/ART/releases/download/1.25.7/ART_1.25.7_Win64.exe'

  silentArgs     = '/verysilent /allusers'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
