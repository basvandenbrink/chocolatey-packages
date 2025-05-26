$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'art'
  fileType       = 'exe'
  softwareName   = 'ART'

  checksum64       = '8b9db33be142675cf544c0c676420186928e2ccec708f49b8f199a3e07fced1b'
  checksumType64   = 'sha256'
  url64            = 'https://github.com/artpixls/ART/releases/download/1.25.5/ART_1.25.5_Win64.exe'

  silentArgs     = '/verysilent /allusers'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
