$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::new()
chcp 65001 | Out-Null
function Info($m){ Write-Host "[INFO] $m" -ForegroundColor Cyan }
function Done($m){ Write-Host "[DONE] $m" -ForegroundColor Green }
function Fail($m){ Write-Host "[ERROR] $m" -ForegroundColor Red }
Set-Location "$HOME\Downloads"
$targetDir = "$HOME\Pictures\Wallpapers"
New-Item -ItemType Directory -Force -Path $targetDir | Out-Null
$wallpaper = Join-Path $targetDir "15-Sequoia-Sunrise.png"
$local = Join-Path $PSScriptRoot "assets\15-Sequoia-Sunrise.png"
$url = "https://raw.githubusercontent.com/jimmy88-8/windows-setup/main/assets/15-Sequoia-Sunrise.png"
if (Test-Path $local) { Info "Using embedded wallpaper / 使用包内壁纸"; Copy-Item $local $wallpaper -Force } else { Info "Downloading wallpaper from your GitHub repo / 从你的 GitHub 仓库下载壁纸"; Invoke-WebRequest -UseBasicParsing -Uri $url -OutFile $wallpaper }
if (-not (Test-Path $wallpaper)) { Fail "Wallpaper file not found / 未找到壁纸文件"; exit 1 }
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -Value 10
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -Value 0
Add-Type @"
using System.Runtime.InteropServices;
public class Wallpaper { [DllImport("user32.dll", SetLastError=true)] public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni); }
"@
[Wallpaper]::SystemParametersInfo(20, 0, $wallpaper, 3) | Out-Null
Done "Wallpaper set to Fill / 壁纸已设置为填充铺满"
Pause
