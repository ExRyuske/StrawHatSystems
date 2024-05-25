#Requires -RunAsAdministrator

scoop update *
choco upgrade all
winget upgrade --all
pause