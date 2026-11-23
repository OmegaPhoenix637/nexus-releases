# Nexus Hub installeren (zonder SmartScreen-melding):
#   irm https://raw.githubusercontent.com/OmegaPhoenix637/nexus-releases/main/install.ps1 | iex
# Haalt de nieuwste Hub uit manifest.json, controleert de SHA-256 en installeert hem voor deze gebruiker.
$ErrorActionPreference = 'Stop'
$ProgressPreference = 'SilentlyContinue'
$base = 'https://raw.githubusercontent.com/OmegaPhoenix637/nexus-releases/main'
Write-Host 'Nexus Hub ophalen...' -ForegroundColor Cyan
$m = Invoke-RestMethod "$base/manifest.json?t=$([DateTimeOffset]::UtcNow.ToUnixTimeSeconds())"
$w = $m.apps.'nexus-hub'.platforms.windows
if (-not $w) { throw 'Geen Nexus Hub gevonden in het manifest.' }
$file = Join-Path $env:TEMP $w.file
Invoke-WebRequest $w.url -OutFile $file -UseBasicParsing
$hash = (Get-FileHash $file -Algorithm SHA256).Hash.ToLower()
if ($hash -ne $w.sha256) { Remove-Item $file; throw 'Controle mislukt: de download klopt niet (SHA-256). Probeer het opnieuw.' }
Write-Host "Installeren ($($w.version))..." -ForegroundColor Cyan
Start-Process $file -ArgumentList '/S' -Wait
Remove-Item $file -ErrorAction SilentlyContinue
$exe = Join-Path $env:LOCALAPPDATA 'Nexus\nexus-hub.exe'
if (Test-Path $exe) { Start-Process $exe; Write-Host 'Klaar! Nexus Hub is gestart.' -ForegroundColor Green }
else { Write-Host 'Geinstalleerd. Start "Nexus" via het Startmenu.' -ForegroundColor Green }
