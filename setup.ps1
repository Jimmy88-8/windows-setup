$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::new()
chcp 65001 | Out-Null

function Info($m){ Write-Host "[INFO] $m" -ForegroundColor Cyan }
function Done($m){ Write-Host "[DONE] $m" -ForegroundColor Green }
function Warn($m){ Write-Host "[WARN] $m" -ForegroundColor Yellow }
function Fail($m){ Write-Host "[ERROR] $m" -ForegroundColor Red }

Info "Starting Windows quick setup / 开始 Windows 快速配置"
Set-Location "$HOME\Downloads"
Info "Working directory / 当前目录: $(Get-Location)"

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Fail "winget is not available. Please install or update App Installer from Microsoft Store."
  Fail "未检测到 winget。请先从 Microsoft Store 安装或更新 App Installer。"
  exit 1
}

$apps = @(
  @{Name="ShareX"; Id="ShareX.ShareX"},
  @{Name="Google Chrome"; Id="Google.Chrome"},
  @{Name="Visual Studio Code"; Id="Microsoft.VisualStudioCode"},
  @{Name="Git"; Id="Git.Git"},
  @{Name="7-Zip"; Id="7zip.7zip"},
  @{Name="LocalSend"; Id="LocalSend.LocalSend"},
  @{Name="PowerToys"; Id="Microsoft.PowerToys"},
  @{Name="Everything"; Id="voidtools.Everything"}
)

foreach ($app in $apps) {
  Info "Installing $($app.Name) / 正在安装 $($app.Name)"
  winget install -e --id $app.Id --accept-package-agreements --accept-source-agreements
  if ($LASTEXITCODE -eq 0) { Done "$($app.Name) installed / 安装完成" } else { Warn "$($app.Name) may have failed or already exists / 可能安装失败或已存在" }
}

Info "Creating common folders / 创建常用文件夹"
$folders = @("$HOME\Projects", "$HOME\Downloads\Setup", "$HOME\Pictures\Screenshots")
foreach ($f in $folders) { New-Item -ItemType Directory -Force -Path $f | Out-Null; Done "Folder ready: $f" }

Info "Showing file extensions / 显示文件扩展名"
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0

Done "Setup completed / 配置完成"
Pause
