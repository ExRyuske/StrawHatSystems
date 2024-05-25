#Requires -RunAsAdministrator

# Debloat Windows
winget uninstall Microsoft.DevHome
winget uninstall Microsoft.YourPhone_8wekyb3d8bbwe
winget uninstall Microsoft.XboxGameOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.XboxSpeechToTextOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.XboxGamingOverlay_8wekyb3d8bbwe
winget uninstall Microsoft.XboxIdentityProvider_8wekyb3d8bbwe
winget uninstall Microsoft.MicrosoftEdge.Stable_8wekyb3d8bbwe

# System Setup
scoop bucket add extras
scoop install extras/vcredist-aio
scoop install main/python
irm https://massgrave.dev/get | iex
start ".\registry.reg"
Copy-Item ".\ExRyuske.ahk.lnk" -Destination "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"
Copy-Item ".\OBS Studio (64bit).lnk" -Destination "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup"

# Chocolatey
Set-ExecutionPolicy AllSigned
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Packages
scoop install git
start "C:\Users\Ryuu\scoop\apps\7zip\current\install-context.reg"
scoop install extras/shutter-encoder
scoop install extras/winaero-tweaker

winget install Discord.Discord
winget install Valve.Steam
winget install LizardByte.Sunshine
winget install WireGuard.WireGuard
winget install AutoHotkey.AutoHotkey
winget install KDE.Krita

choco install dotnet-desktopruntime -y
choco install brave -y
choco install 64gram -y
choco install temurinjre -y
choco install github-desktop -y
choco install nomacs -y
choco install vlc -y
choco install vscodium -y
choco install libreoffice-fresh -y
choco install audacity -y
choco install steelseries-engine -y
choco install qbittorrent -y
choco install obs-studio -y
choco install upscayl -y
choco install razer-synapse-3 -y
choco install epicgameslauncher -y

start "https://amernimezone.com/#download"
# start "XM1r.exe"
pause