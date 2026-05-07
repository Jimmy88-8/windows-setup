# Install VS Code and extensions

Write-Host "Installing Visual Studio Code..." -ForegroundColor Green

if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
    Write-Host "winget is not installed or not available." -ForegroundColor Red
    Write-Host "Install 'App Installer' from Microsoft Store first." -ForegroundColor Yellow
    exit 1
}

winget install -e --id Microsoft.VisualStudioCode --accept-package-agreements --accept-source-agreements

$codePaths = @(
    "$env:LOCALAPPDATA\Programs\Microsoft VS Code\bin\code.cmd",
    "$env:ProgramFiles\Microsoft VS Code\bin\code.cmd"
)

$code = $codePaths | Where-Object { Test-Path $_ } | Select-Object -First 1

if ($code) {
    Write-Host "Installing VS Code extensions..." -ForegroundColor Cyan
    & $code --install-extension ms-python.python
    & $code --install-extension ms-vscode.powershell
    & $code --install-extension esbenp.prettier-vscode
    & $code --install-extension ritwickdey.LiveServer
    Write-Host "VS Code extensions installed." -ForegroundColor Green
} else {
    Write-Host "VS Code command was not found. Open VS Code once, then run this script again." -ForegroundColor Yellow
}

Write-Host "VS Code setup completed." -ForegroundColor Green
