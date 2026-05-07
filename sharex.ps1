$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::new()
chcp 65001 | Out-Null
function Info($m){ Write-Host "[INFO] $m" -ForegroundColor Cyan }
function Done($m){ Write-Host "[DONE] $m" -ForegroundColor Green }
function Fail($m){ Write-Host "[ERROR] $m" -ForegroundColor Red }
Set-Location "$HOME\Downloads"
Info "Installing ShareX / 正在安装 ShareX"
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) { Fail "winget not found / 未检测到 winget"; exit 1 }
winget install -e --id ShareX.ShareX --accept-package-agreements --accept-source-agreements
if ($LASTEXITCODE -eq 0) { Done "ShareX installed / ShareX 安装完成" } else { Fail "ShareX install failed / ShareX 安装失败" }
Pause
