$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'art'
  fileType       = 'exe'
  softwareName   = 'ART'

  checksum64       = '8145026a42a73baf3099fec80bc046d1e4b8bbd3ff663d8c1f94f7978f7893c0'
  checksumType64   = 'sha256'
  url64            = 'https://github.com/artraweditor/ART/releases/download/1.26.2/ART_1.26.2_Win64.exe'

  silentArgs     = '/verysilent /allusers'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
