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
  $version_matches = ($releases.Content | Select-String -Pattern '<h3>Table of Downloads for version (([\.\d]+)(-[\w\d]+)) \(.*\)</h3>').Matches
  $version_stripped = $version_matches.Groups[2]
  $version_full = $version_matches.Groups[1]
  $url   = "/downloads/WindowsInstaller/betterbird-{0}.en-US.win64.installer.exe" -f $version_full

  @{
    URL64 = $domain + $url
    Version = $version_stripped
  }
}

update -ChecksumFor 64
