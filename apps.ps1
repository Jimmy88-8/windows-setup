$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::new()
chcp 65001 | Out-Null
function Info($m){ Write-Host "[INFO] $m" -ForegroundColor Cyan }
function Done($m){ Write-Host "[DONE] $m" -ForegroundColor Green }
function Warn($m){ Write-Host "[WARN] $m" -ForegroundColor Yellow }
Set-Location "$HOME\Downloads"
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) { Write-Host "[ERROR] winget not found / 未检测到 winget" -ForegroundColor Red; exit 1 }
$ids = @("ShareX.ShareX","Google.Chrome","Microsoft.VisualStudioCode","Git.Git","7zip.7zip","LocalSend.LocalSend","Microsoft.PowerToys","voidtools.Everything","VideoLAN.VLC")
foreach ($id in $ids) { Info "Installing $id"; winget install -e --id $id --accept-package-agreements --accept-source-agreements; if($LASTEXITCODE -eq 0){Done "$id done"}else{Warn "$id skipped or failed"} }
Pause
