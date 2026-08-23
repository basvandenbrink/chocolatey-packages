import-module au
. "$PSScriptRoot\update_helper.ps1"

$domain   = 'https://www.betterbird.eu'
$releases = "$domain/downloads/index.php"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1" = @{
      "(?i)(^\s*\`$installerPrefix\s*=\s*)('.*')"        = "`$1'$($Latest.InstallerPrefix)'"
    }
  }
}

function global:au_GetLatest {
  $installerPrefix = GetInstallerPrefix


  $version_matches = ($installerPrefix | Select-String -AllMatches -Pattern '^betterbird-(?<Version>[0-9]+\.[0-9]+\.[0-9]+)[-a-z0-9]*$').Matches
  $version_match = $version_matches[0]
  $version = $version_match.Groups['Version']

  @{
    InstallerPrefix = $installerPrefix
    Version = $version
  }
}

function global:au_AfterUpdate {
  $installerPrefix = $Latest.InstallerPrefix
  CreateChecksumsFile -ToolsDirectory "$PSScriptRoot\tools" -InstallerPrefix $installerPrefix
}

update -ChecksumFor none
