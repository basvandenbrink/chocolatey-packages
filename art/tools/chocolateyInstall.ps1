$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'art'
  fileType       = 'exe'
  softwareName   = 'ART'

  checksum64       = 'a2729aee4a722da6787925d4bd99f51cd20ff46fdaf216fe5cf8f22b320baf69'
  checksumType64   = 'sha256'
  url64            = 'https://github.com/artraweditor/ART/releases/download/1.26.4/ART_1.26.4_Win64.exe'

  silentArgs     = '/verysilent /allusers'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
