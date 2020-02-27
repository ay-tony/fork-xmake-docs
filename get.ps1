#!/usr/bin/env pwsh
#Requires -version 5

param (
  [string]$version = "master",
  [string]$installdir = ""
)

& {
  $getscript = (Invoke-Webrequest 'https://cdn.jsdelivr.net/gh/xmake-io/xmake@master/scripts/get.ps1' -UseBasicParsing).Content
  if ($getscript -is [Byte[]]) {
    $getscript = [System.Text.Encoding]::UTF8.GetString($getscript)
  }
  & $([System.Management.Automation.ScriptBlock]::Create($getscript)) $version $installdir
}
