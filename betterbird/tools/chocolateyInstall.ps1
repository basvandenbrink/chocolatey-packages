$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'betterbird'
  fileType       = 'exe'
  softwareName   = 'Betterbird'

  checksum       = '4840f23905a6b2223262db84505e81bc57bc32cbc4d7425a7f0b14c04bc4f418'
  checksumType   = 'sha256'
  url            = 'https://www.betterbird.eu/downloads/WindowsInstaller/betterbird-91.8.0-bb29.en-US.win64.installer.exe'

  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
