$ErrorActionPreference = 'Stop'

$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
. $toolsPath\helpers.ps1

$softwareName = 'Betterbird'
$fullVersion = '128.10.1esr-bb27-build2'

$locale = 'en-US' #https://github.com/chocolatey/chocolatey-coreteampackages/issues/933
$locale = GetLocale -localeFile "$toolsPath\LanguageChecksums.csv" -product $softwareName

$urlPrefix = 'https://www.betterbird.eu/downloads/WindowsInstaller/'
$downloadFileName = 'betterbird-{0}.{1}.win64.installer.exe' -f $fullVersion, $locale
$url = "{0}{1}" -f $urlPrefix, $downloadFileName

$wc = New-Object System.Net.WebClient
$stream = $null

try {
  $stream = $wc.OpenRead($url)
} catch {
  Write-Host "It appears that a new version of Betterbird already has been released, using the archive URL."
  $url = "{0}Previous/{1}" -f $urlPrefix, $downloadFileName
} finally {
  if ($null -ne $stream ){
    $stream.Close()
  }
}

$checksum = GetChecksum -language $locale -checksumFile "$toolsPath\LanguageChecksums.csv"

$packageArgs = @{
  packageName    = 'betterbird'
  fileType       = 'exe'
  softwareName   = 'Betterbird'

  checksum       = $checksum
  checksumType   = 'sha256'
  url            = $url

  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
