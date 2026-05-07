# Install Common Apps

Write-Host "Installing common apps..." -ForegroundColor Green

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

Write-Host "Common apps installation completed." -ForegroundColor Green
