$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'betterbird'
  fileType       = 'exe'
  softwareName   = 'Betterbird'

  checksum       = '7b598b551968ae62910372920f08cf7967379fd8687ff93594451ef025223272'
  checksumType   = 'sha256'
  url            = 'https://www.betterbird.eu/downloads/WindowsInstaller/betterbird-91.9.0-bb31.en-US.win64.installer.exe'

  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
