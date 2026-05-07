# Windows Quick Setup / Windows 快速配置工具箱

Personal Windows setup dashboard for quickly copying CMD / PowerShell commands on new, school, lab, or temporary Windows computers.

个人 Windows 初始化命令工具箱网页。适合在学校电脑、实验室电脑、新电脑或临时 Windows 设备上快速复制命令，完成基础配置。

## Website / 网站

https://jimmy88-8.github.io/windows-setup/

## Main Features / 主要功能

- Bilingual Chinese / English interface
- CMD-friendly commands with UTF-8 support: `chcp 65001`
- Commands start in `%USERPROFILE%\Downloads` to reduce permission issues
- Search, category filter, shell filter, risk filter
- Presets: school, development, personalization
- Copy feedback and recent copy history
- Risk labels and command details
- Embedded wallpaper asset

## Quick Commands / 快速命令

### Full Setup / 完整配置

```cmd
chcp 65001 >nul && cd /d "%USERPROFILE%\Downloads" && powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/jimmy88-8/windows-setup/main/setup.ps1' -OutFile 'setup.ps1'; notepad setup.ps1; & powershell -NoProfile -ExecutionPolicy Bypass -File '.\setup.ps1'"
```

### Install ShareX / 安装 ShareX

```cmd
chcp 65001 >nul && cd /d "%USERPROFILE%\Downloads" && powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/jimmy88-8/windows-setup/main/sharex.ps1' -OutFile 'sharex.ps1'; & powershell -NoProfile -ExecutionPolicy Bypass -File '.\sharex.ps1'"
```

## Files / 文件结构

```text
windows-setup/
├─ README.md
├─ setup.ps1
├─ sharex.ps1
├─ apps.ps1
├─ vscode.ps1
├─ wallpaper.ps1
├─ folders.ps1
├─ docs/
│  └─ index.html
└─ assets/
   └─ 15-Sequoia-Sunrise.png
```

## GitHub Pages / 部署

Settings → Pages → Deploy from a branch → `main` → `/docs`

## Safety / 安全提醒

Do not publish passwords, tokens, SSH private keys, API keys, or private personal configuration in this public repository.

不要在公开仓库中保存密码、Token、SSH 私钥、API Key 或私人配置。


## v0.5 UI Update

- Commands are collapsed by default to reduce visual clutter.
- Added Chinese / English language toggle.
- English appears only when selected or necessary labels require it.


## v0.6 UI Update

- 增强页面视觉层次和呼吸感。
- 增加柔和渐变背景、玻璃拟态卡片、圆角和更大的间距。
- 保持命令默认折叠，降低首屏信息密度。
- 保留中文 / English 切换、深浅主题切换、搜索和筛选功能。
