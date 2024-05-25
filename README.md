# StrawHatSystem
My configurations for [Arch Linux](linux/README.md), [SteamOS](steamos/README.md), and [Windows](windows/README.md).

### [Arch Linux](arch/README.md)
Install
```
sudo pacman -S git --needed
git clone https://github.com/ExRyuske/StrawHatSystems.git
chmod -R 777 ./StrawHatSystems/archlinux/install.sh
./StrawHatSystems/archlinux/install.sh
```
Launch Options for Steam
```
gamemoderun mangohud --dlsym %command%
```
### [SteamOS](steamos/README.md)
Install
```
passwd
sudo steamos-readonly disable
git clone https://github.com/ExRyuske/StrawHatSystems.git
chmod -R 777 ./StrawHatSystems/steamos/install.sh
./StrawHatSystems/steamos/install.sh
```
Update
```
sudo steamos-readonly disable
git clone https://github.com/ExRyuske/StrawHatSystems.git
chmod -R 777 ./StrawHatSystems/steamos/update.sh
./StrawHatSystems/steamos/update.sh
```
### [Windows](windows/README.md)
Install
```
git clone https://github.com/ExRyuske/StrawHatSystems.git
cd .\StrawHatSystems\windows
.\install.ps1
```
Update
```
.\update.ps1
```
