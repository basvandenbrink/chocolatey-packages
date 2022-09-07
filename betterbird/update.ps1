import-module au

$domain   = 'https://www.betterbird.eu'
$releases = "$domain/downloads/index.php"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*\`$fullVersion\s*=\s*)('.*')"        = "`$1'$($Latest.FullVersion)'"
      "(?i)(^\s*checksum\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
      "(?i)(^\s*checksumType\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $releases = Invoke-WebRequest $releases
  $version_matches = ($releases.Content | Select-String -AllMatches -Pattern '<h3>Table of Downloads for version (([\.\d]+)(-[\w\d]+)) \(.*\)</h3>').Matches
  # Since the release of Betterbird 102, the download page has two entries, one for 91 and one for 102. Always pick the last entry.
  $version_match = $version_matches[$version_matches.length - 1]
  $version_stripped = $version_match.Groups[2]
  $version_full = $version_match.Groups[1]

  @{
    FullVersion = $version_full
    Version = $version_stripped
  }
}

update -ChecksumFor 64 -NoCheckChocoVersion
