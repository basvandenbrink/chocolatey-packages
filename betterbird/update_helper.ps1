# Inspired from from https://github.com/chocolatey-community/chocolatey-packages/blob/master/automatic/firefox/update_helper.ps1
# import-module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"
$localeChecksumFile = 'LanguageChecksums.csv'

function CreateChecksumsFile() {
  param(
    [string]$ToolsDirectory,
    [string]$FullVersion
  )
  $allChecksums = Invoke-WebRequest -UseBasicParsing -Uri "https://betterbird.eu/downloads/sha256-140.txt"

  $reOpts = [System.Text.RegularExpressions.RegexOptions]::Multiline `
    -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
  $checksumRows = [regex]::Matches("$allChecksums", "^([a-f\d]+)\s*\*betterbird-$FullVersion\.([a-z\-]+)\.win64\.installer.exe$", $reOpts) | % {
    return "$($_.Groups[2])|$($_.Groups[1].Value)"
  }

  if (!$checksumRows) {
    throw "Unable to extract a valid checksum for version $FullVersion, please look into the reason. A upstream change may be the cause..."
  }

  $checksumRows | Out-File "$ToolsDirectory\$localeChecksumFile" -Encoding utf8
}
