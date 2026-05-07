# Windows Setup

Personal Windows setup scripts and quick install commands.

## CMD-compatible commands

### Install ShareX

```cmd
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/jimmy88-8/windows-setup/main/sharex.ps1' -OutFile 'sharex.ps1'; & powershell -NoProfile -ExecutionPolicy Bypass -File '.\\sharex.ps1'"
```

### Full Setup

```cmd
powershell -NoProfile -ExecutionPolicy Bypass -Command "[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/jimmy88-8/windows-setup/main/setup.ps1' -OutFile 'setup.ps1'; notepad setup.ps1; & powershell -NoProfile -ExecutionPolicy Bypass -File '.\\setup.ps1'"
```

## Notes

Do not store passwords, API keys, SSH keys, tokens, or private configuration files in this public repository.
