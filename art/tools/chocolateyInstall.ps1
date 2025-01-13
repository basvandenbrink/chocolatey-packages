$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'art'
  fileType       = 'exe'
  softwareName   = 'ART'

  checksum64       = '9a819a985e8e3bcc7bce9b9f98e355a6a46c26878aae53c1bf60276ee89feda4'
  checksumType64   = 'sha256'
  url64            = 'https://github.com/artpixls/ART/releases/download/1.24.5/ART_1.24.5_Win64.exe'

  silentArgs     = '/verysilent /allusers'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
