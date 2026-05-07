$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::new()
chcp 65001 | Out-Null
function Info($m){ Write-Host "[INFO] $m" -ForegroundColor Cyan }
function Done($m){ Write-Host "[DONE] $m" -ForegroundColor Green }
function Warn($m){ Write-Host "[WARN] $m" -ForegroundColor Yellow }
Set-Location "$HOME\Downloads"
Info "Installing VS Code / 正在安装 VS Code"
winget install -e --id Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements
Info "Installing extensions / 正在安装扩展"
$code = Get-Command code -ErrorAction SilentlyContinue
if (-not $code) { Warn "code command not found. Open VS Code once, then run again. / 未找到 code 命令，请先打开一次 VS Code 后重试。"; Pause; exit 0 }
$exts = @("ms-python.python","ms-vscode.powershell","esbenp.prettier-vscode","dbaeumer.vscode-eslint","eamodio.gitlens","bradlc.vscode-tailwindcss","ritwickdey.LiveServer","MS-CEINTL.vscode-language-pack-zh-hans")
foreach ($e in $exts) { Info "Installing $e"; code --install-extension $e }
Done "VS Code setup completed / VS Code 配置完成"
Pause
