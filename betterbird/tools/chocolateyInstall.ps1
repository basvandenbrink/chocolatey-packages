$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'betterbird'
  fileType       = 'exe'
  softwareName   = 'Betterbird'

  checksum       = '284321d6acfb70befe184a2ca050f846f41162527e0da83333a03c58ad62c45d'
  checksumType   = 'sha256'
  url            = 'https://www.betterbird.eu/downloads/WindowsInstaller/betterbird-91.8.1-bb30.en-US.win64.installer.exe'

  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
