# Install Common Apps

Write-Host "Installing common apps..." -ForegroundColor Green

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget is not installed or not available." -ForegroundColor Red
    exit 1
}

winget install -e --id ShareX.ShareX --accept-package-agreements --accept-source-agreements
winget install -e --id Google.Chrome --accept-package-agreements --accept-source-agreements
winget install -e --id Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements
winget install -e --id LocalSend.LocalSend --accept-package-agreements --accept-source-agreements
winget install -e --id 7zip.7zip --accept-package-agreements --accept-source-agreements

Write-Host "Common apps installation completed." -ForegroundColor Green
