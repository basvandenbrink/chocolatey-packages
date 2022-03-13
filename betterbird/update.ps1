import-module au

$domain   = 'https://www.betterbird.eu'
$releases = "$domain/downloads/index.php"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*url\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $releases = Invoke-WebRequest $releases
  $version = ($releases.Content | Select-String -Pattern '<h3>Table of Downloads for version ([\.\d]+(-[\w\d]+)) \(.*\)</h3>').Matches.Groups[1].Value
  $url   = "/downloads/WindowsInstaller/betterbird-{0}.en-US.win64.installer.exe" -f $version

  @{
    URL64 = $domain + $url
    Version = $version
  }
}

update -ChecksumFor 64
