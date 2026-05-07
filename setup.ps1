# Basic Windows Setup Script

Write-Host "Starting Windows setup..." -ForegroundColor Green

# Move to Downloads to avoid permission issues
Set-Location -Path "$HOME\Downloads"

# Check winget
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget is not installed or not available." -ForegroundColor Red
    Write-Host "Please install App Installer from Microsoft Store first." -ForegroundColor Yellow
    exit 1
}

Write-Host "winget found." -ForegroundColor Green

# Install apps
Write-Host "Installing basic apps..." -ForegroundColor Cyan

winget install -e --id ShareX.ShareX --accept-package-agreements --accept-source-agreements
winget install -e --id Google.Chrome --accept-package-agreements --accept-source-agreements
winget install -e --id Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements
winget install -e --id LocalSend.LocalSend --accept-package-agreements --accept-source-agreements
winget install -e --id 7zip.7zip --accept-package-agreements --accept-source-agreements

Write-Host "Basic apps installed." -ForegroundColor Green

# Optional Windows settings
Write-Host "Applying simple Windows settings..." -ForegroundColor Cyan

# Show file extensions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name HideFileExt -Value 0

# Restart Explorer to apply some settings
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
Start-Process explorer.exe

Write-Host "Setup completed." -ForegroundColor Green
