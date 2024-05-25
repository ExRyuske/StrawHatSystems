# PowerShell
winget install Microsoft.Powershell

# Scoop
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

# Install what requires administrator rights
$Path = Get-Location
Start-Process pwsh.exe $Path\src\install-administrator.ps1 -Verb RunAs
