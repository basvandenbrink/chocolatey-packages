$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'betterbird'
  fileType       = 'exe'
  softwareName   = 'Betterbird'

  checksum       = '8dd63e2993d52f068bb41e169fcb6cac90fdd8160118508988bf21c7061343d6'
  checksumType   = 'sha256'
  url            = 'https://www.betterbird.eu/downloads/WindowsInstaller/betterbird-91.7.0-bb28.en-US.win64.installer.exe'

  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
