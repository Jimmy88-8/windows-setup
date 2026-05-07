$OutputEncoding = [Console]::OutputEncoding = [Text.UTF8Encoding]::new()
chcp 65001 | Out-Null
$folders = @("$HOME\Projects", "$HOME\Downloads\Setup", "$HOME\Pictures\Screenshots", "$HOME\Pictures\Wallpapers")
foreach ($f in $folders) { New-Item -ItemType Directory -Force -Path $f | Out-Null; Write-Host "[DONE] Folder ready / 文件夹已创建: $f" -ForegroundColor Green }
Pause
