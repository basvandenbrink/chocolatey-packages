import-module au
. "$PSScriptRoot\update_helper.ps1"

$domain   = 'https://www.betterbird.eu'
$releases = "$domain/downloads/index.php"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*\`$fullVersion\s*=\s*)('.*')"        = "`$1'$($Latest.FullVersion)'"
    }
  }
}

function global:au_GetLatest {
  $releases = Invoke-WebRequest $releases
  $version_matches = ($releases.Content | Select-String -AllMatches -Pattern '<h3>Current version: Betterbird (([\.\d]+)(esr-[\w\d]+)).*</h3>').Matches
  $version_match = $version_matches[0]
  $version_stripped = $version_match.Groups[2]
  $version_full = $version_match.Groups[1]

  @{
    FullVersion = $version_full
    Version = $version_stripped
  }
}

function global:au_AfterUpdate {
  $version_full = $Latest.FullVersion
  CreateChecksumsFile -ToolsDirectory "$PSScriptRoot\tools" -FullVersion $version_full
}

update -ChecksumFor none
