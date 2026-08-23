# Inspired from from https://github.com/chocolatey-community/chocolatey-packages/blob/master/automatic/firefox/update_helper.ps1
# import-module "$PSScriptRoot\..\..\scripts\au_extensions.psm1"
$localeChecksumFile = 'LanguageChecksums.csv'
$checksumsUrl = "https://betterbird.eu/downloads/sha256-153.txt"

function GetInstallerPrefix() {
  $allChecksums = Invoke-WebRequest -UseBasicParsing -Uri $checksumsUrl

  if ($allChecksums.Content -match "(?m)^([a-f\d]+)\s*\*(?<InstallerPrefix>betterbird-[-\.a-z0-9]+)\.en-US\.win64\.installer\.exe$") {
    return $Matches['InstallerPrefix']
  } else {
    throw "Unable to extract the installer prefix from the checksums file."
  }
}

function CreateChecksumsFile() {
  param(
    [string]$ToolsDirectory,
    [string]$InstallerPrefix
  )
  $allChecksums = Invoke-WebRequest -UseBasicParsing -Uri $checksumsUrl

  $reOpts = [System.Text.RegularExpressions.RegexOptions]::Multiline `
    -bor [System.Text.RegularExpressions.RegexOptions]::IgnoreCase
  $checksumRows = [regex]::Matches("$allChecksums", "^([a-f\d]+)\s*\*$InstallerPrefix\.([a-z\-]+)\.win64\.installer.exe$", $reOpts) | % {
    return "$($_.Groups[2])|$($_.Groups[1].Value)"
  }

  if (!$checksumRows) {
    throw "Unable to extract a valid checksum for version $InstallerPrefix, please look into the reason. A upstream change may be the cause..."
  }

  $checksumRows | Out-File "$ToolsDirectory\$localeChecksumFile" -Encoding utf8
}
