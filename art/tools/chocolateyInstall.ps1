$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'art'
  fileType       = 'exe'
  softwareName   = 'ART'

  checksum64       = '325bf777140eeb46492be185d5c35b97dd20aa42f2e7a12ac863dc5d5b2fe948'
  checksumType64   = 'sha256'
  url64            = 'https://github.com/artraweditor/ART/releases/download/1.26.6/ART_1.26.6_Win64.exe'

  silentArgs     = '/verysilent /allusers'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
