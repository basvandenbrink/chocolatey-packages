$ErrorActionPreference = 'Stop'

$fullVersion = '91.13.0-bb36'
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

  checksum       = '04f55512259899ac837b05046573b2d43e6cb5f28eb7fed00938cfe86c830baa'
  checksumType   = 'sha256'
  url            = $url

  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
