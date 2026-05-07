# Set bundled macOS Sequoia Sunrise image as Windows wallpaper, using Fill mode

Write-Host "Setting up bundled wallpaper..." -ForegroundColor Green

$repoWallpaperUrl = "https://raw.githubusercontent.com/jimmy88-8/windows-setup/main/assets/15-Sequoia-Sunrise.png"
$downloadDir = Join-Path $env:USERPROFILE "Downloads"
$wallpaperPath = Join-Path $downloadDir "15-Sequoia-Sunrise.png"

if (-not (Test-Path $downloadDir)) {
    New-Item -ItemType Directory -Path $downloadDir | Out-Null
}

# If the image is already packaged locally beside this script, use it first.
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$localWallpaperPath = Join-Path $scriptDir "assets\15-Sequoia-Sunrise.png"

if (Test-Path $localWallpaperPath) {
    Write-Host "Using local bundled wallpaper image..." -ForegroundColor Cyan
    Copy-Item -Path $localWallpaperPath -Destination $wallpaperPath -Force
} else {
    Write-Host "Downloading wallpaper from your GitHub repository..." -ForegroundColor Cyan
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -UseBasicParsing -Uri $repoWallpaperUrl -OutFile $wallpaperPath
}

Write-Host "Setting wallpaper to Fill mode..." -ForegroundColor Cyan

Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name Wallpaper -Value $wallpaperPath
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name WallpaperStyle -Value "10"
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name TileWallpaper -Value "0"

Add-Type @"
using System;
using System.Runtime.InteropServices;
public class Wallpaper {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
}
"@

[Wallpaper]::SystemParametersInfo(20, 0, $wallpaperPath, 3) | Out-Null

Write-Host "Wallpaper setup completed." -ForegroundColor Green
Write-Host "Wallpaper saved to: $wallpaperPath" -ForegroundColor Gray
