$ErrorActionPreference = 'Stop'

$fullVersion = '91.9.1-bb32'
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

  checksum       = 'dc2fc14d1cdd7016e82bb8e8c06f90d7ce8c3982945b0f0d21a24a48b9e01414'
  checksumType   = 'sha256'
  url            = $url

  silentArgs     = '-ms'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
