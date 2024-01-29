# StrawHatLinux
My CachyOS configuration
```
#Configs
chsh -s /usr/bin/bash
bash
git clone https://github.com/ExRyuske/StrawHatLinux.git
cd StrawHatLinux
sudo cp -r etc /
#idk how to copy home folder
sudo cp -r usr /
sudo pacman -Sy

#Privilege elevation (OpenDoas)
sudo pacman -S opendoas
echo "alias sudo='doas'" >> ~/.bashrc
echo "alias sudoedit='doas rnano'" >> ~/.bashrc
doas pacman -Rdd sudo

#AUR (Chaotic-AUR)
doas pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
doas pacman-key --lsign-key 3056513887B78AEB
doas pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
doas pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo '[chaotic-aur]' | doas tee -a /etc/pacman.conf
echo 'Include = /etc/pacman.d/chaotic-mirrorlist' | doas tee -a /etc/pacman.conf

#Update & Upgrade system
sudo pacman -S doas-sudo-shim
paru -Syuu

#Kernel (CachyOS-LTS)
paru -S linux-cachyos-lts linux-cachyos-lts-headers
paru -Rs linux-cachyos linux-cachyos-headers

#Drivers (AMD)
paru -S lib32-mesa rocm-opencl-runtime vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver

#Desktop Environment (Gnome)
paru -S gnome
cd /usr/share/gnome-shell/extensions
doas rm -r apps-menu@gnome-shell-extensions.gcampax.github.com auto-move-windows@gnome-shell-extensions.gcampax.github.com drive-menu@gnome-shell-extensions.gcampax.github.com launch-new-instance@gnome-shell-extensions.gcampax.github.com light-style@gnome-shell-extensions.gcampax.github.com native-window-placement@gnome-shell-extensions.gcampax.github.com places-menu@gnome-shell-extensions.gcampax.github.com screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com user-theme@gnome-shell-extensions.gcampax.github.com window-list@gnome-shell-extensions.gcampax.github.com windowsNavigator@gnome-shell-extensions.gcampax.github.com workspace-indicator@gnome-shell-extensions.gcampax.github.com
paru -S breeze dconf-editor gnome-shell-extension-appindicator gnome-shell-extension-clipboard-indicator

#Packages
paru -S brave-bin jdk-temurin jdk17-temurin gnome-session-properties
paru -S davinci-resolve easyeffects gamemode lib32-gamemode goverlay heroic-games-launcher kate krita libreoffice-still lsp-plugins obs-studio-tytan652 proton-ge-custom-bin protontricks portproton qbittorrent shutter-encoder-bin steam kotatogram-desktop-bin upscayl vesktop-bin vscodium yandex-browser dolphin kio-admin obs-pipewire-audio-capture-bin prismlauncher

#Python (Pip + OBS)
paru -S python-pip
python -m venv obsws
obsws/bin/python -m pip install obsws-python

#External drives
doas mkdir /mnt/games && doas chmod -R 777 /mnt/games
echo '/dev/disk/by-uuid/ae38bf74-d54f-4630-aded-385d98805e2b /mnt/games auto nosuid,nodev,nofail,x-gvfs-show 0 0' | sudo tee -a /etc/fstab
doas mkdir /mnt/media && doas chmod -R 777 /mnt/media
echo '/dev/disk/by-uuid/541d1bcd-85e2-45c6-955a-8904e6dc5483 /mnt/media auto nosuid,nodev,nofail,x-gvfs-show 0 0' | sudo tee -a /etc/fstab

#Samba
paru -S samba
systemctl enable smb.service
doas smbpasswd -a ryuu

#Cleanup
paru -Rs nautilus cachy-browser octopi alacritty cachyos-packageinstaller parole galculator linux-cachyos-zfs cachyos-gnome-settings gnome-maps gnome-music gnome-calendar gnome-characters gnome-clocks cachyos-fish-config cachyos-zsh-config cachyos-kernel-manager vim simple-scan epiphany gnome-contacts sushi evince gnome-weather gnome-font-viewer lftp gnome-text-editor gnome-software cachyos-hello gnome-tour xed gnome-user-docs yelp qt5ct totem
paru -Qtdq | paru -Rns - && doas paccache -r && doas paccache -rk1 && paru -Sc
```
```
#After reboot
gnome-extensions enable AlphabeticalAppGrid@stuarthayhurst
gnome-extensions enable appindicatorsupport@rgcjonas.gmail.com
gnome-extensions enable clipboard-indicator@tudmotu.com
gnome-extensions enable smart-auto-move@khimaros.com
```
