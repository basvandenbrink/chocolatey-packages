Import-Module au
Import-Module "$PSScriptRoot\..\scripts\au_extensions.psm1"

$softwareName = 'ART'

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyInstall.ps1"   = @{
      "(?i)(^\s*url64\s*=\s*)('.*')"          = "`$1'$($Latest.URL64)'"
      "(?i)(^\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
      "(?i)(^\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
      "(?i)^(\s*softwareName\s*=\s*)'.*'"     = "`${1}'$softwareName'"
    }
    ".\tools\chocolateyUninstall.ps1" = @{
      "(?i)^(\s*softwareName\s*=\s*)'.*'" = "`${1}'$softwareName'"
    }
  }
}

function global:au_GetLatest {
  $LatestRelease = Get-GitHubRelease artpixls ART

  @{
    URL64        = $LatestRelease.assets | Where-Object {$_.name.EndsWith("Win64.exe")} | Select-Object -ExpandProperty browser_download_url
    Version      = $LatestRelease.tag_name
    ReleaseNotes = $LatestRelease.html_url
  }
}

update -ChecksumFor 64
