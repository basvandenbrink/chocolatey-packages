$ErrorActionPreference = 'Stop'

$fullVersion = '91.11.0-bb34'
$urlPrefix = 'https://www.betterbird.eu/downloads/WindowsInstaller/'
$downloadFileName = 'betterbird-{0}.en-US.win64.installer.exe' -f $fullVersion
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

$packageArgs = @{
  packageName    = 'betterbird'
  fileType       = 'exe'
  softwareName   = 'Betterbird'

  checksum       = '80dcae180be227ce1cb5d09f113f248d33292d95f4f07f8d731a20c40a5ff4a8'
  checksumType   = 'sha256'
  url            = $url

  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
