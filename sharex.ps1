# Install ShareX

Write-Host "Installing ShareX..." -ForegroundColor Green

# Move to Downloads to avoid permission issues
Set-Location -Path "$HOME\Downloads"

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget is not installed or not available." -ForegroundColor Red
    exit 1
}

winget install -e --id ShareX.ShareX --accept-package-agreements --accept-source-agreements

Write-Host "ShareX installation completed." -ForegroundColor Green
