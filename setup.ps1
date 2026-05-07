# Basic Windows Setup Script

Write-Host "Starting Windows setup..." -ForegroundColor Green

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget is not installed or not available." -ForegroundColor Red
    Write-Host "Install 'App Installer' from Microsoft Store first." -ForegroundColor Yellow
    exit 1
}

$apps = @(
    "ShareX.ShareX",
    "Google.Chrome",
    "Microsoft.VisualStudioCode",
    "LocalSend.LocalSend",
    "7zip.7zip"
)

foreach ($app in $apps) {
    Write-Host "Installing $app..." -ForegroundColor Cyan
    winget install -e --id $app --accept-package-agreements --accept-source-agreements
}

Write-Host "Showing file extensions..." -ForegroundColor Cyan
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0

Write-Host "Restarting Explorer..." -ForegroundColor Cyan
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
Start-Process explorer.exe

Write-Host "Setup completed." -ForegroundColor Green
