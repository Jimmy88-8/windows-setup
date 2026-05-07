# Install VS Code and extensions

Write-Host "Installing Visual Studio Code..." -ForegroundColor Green

# Move to Downloads to avoid permission issues
Set-Location -Path "$HOME\Downloads"

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget is not installed or not available." -ForegroundColor Red
    exit 1
}

winget install -e --id Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements

Write-Host "Waiting for VS Code command to become available..." -ForegroundColor Cyan
Start-Sleep -Seconds 5

$codeCommand = Get-Command code -ErrorAction SilentlyContinue

if ($codeCommand) {
    Write-Host "Installing VS Code extensions..." -ForegroundColor Cyan

    code --install-extension ms-python.python
    code --install-extension ms-vscode.powershell
    code --install-extension esbenp.prettier-vscode
    code --install-extension ritwickdey.LiveServer

    Write-Host "VS Code extensions installed." -ForegroundColor Green
} else {
    Write-Host "VS Code command 'code' was not found. Open VS Code once, then run this script again." -ForegroundColor Yellow
}

Write-Host "VS Code setup completed." -ForegroundColor Green
