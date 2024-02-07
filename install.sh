#Configs
sudo cp -r StrawHatLinux/etc /
sudo cp -r StrawHatLinux/usr /

#Privilege elevation (OpenDoas)
sudo pacman -S opendoas
doas pacman -Rdd sudo
doas ln -s $(which doas) /usr/bin/sudo
echo "alias sudo='doas'" >> ~/.bashrc
echo "alias sudoedit='doas rnano'" >> ~/.bashrc

#Package management (Paru + Chaotic-AUR)
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
doas pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
doas pacman-key --lsign-key 3056513887B78AEB
doas pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
doas pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo '[chaotic-aur]' | doas tee -a /etc/pacman.conf
echo 'Include = /etc/pacman.d/chaotic-mirrorlist' | doas tee -a /etc/pacman.conf

#Upgrade system and install needed packages
paru -Syuu
paru -S jdk-temurin jdk17-temurin

#Kernel (TKG)
paru -S linux-lts-tkg-eevdf linux-lts-tkg-eevdf-headers
paru -Rs linux-lts linux-lts-headers

#Graphics drivers (AMD)
paru -S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver rocm-opencl-runtime --needed

#Audio (PipeWire)


#Desktop environment (Gnome + Wayland)
paru -s plasma

#Python (Pip + OBS)
cd
paru -S python-pip obs-studio-tytan652 obs-pipewire-audio-capture-bin
python -m venv obsws
obsws/bin/python -m pip install obsws-python

#Gaming
paru -S steam proton-ge-custom-bin protontricks gamemode lib32-gamemode goverlay heroic-games-launcher-bin prismlauncher needed
doas usermod -a -G games

#External drives
doas mkdir /mnt/games
doas chmod -R 777 /mnt/games
echo '/dev/disk/by-uuid/ae38bf74-d54f-4630-aded-385d98805e2b /mnt/games auto nosuid,nodev,nofail,x-gvfs-show 0 0' | sudo tee -a /etc/fstab
doas mkdir /mnt/media
doas chmod -R 777 /mnt/media
echo '/dev/disk/by-uuid/541d1bcd-85e2-45c6-955a-8904e6dc5483 /mnt/media auto nosuid,nodev,nofail,x-gvfs-show 0 0' | sudo tee -a /etc/fstab

#Server (ZeroTier + Sunshine + Samba)
paru -S zerotier-one sunshine samba --needed
systemctl enable zerotier-one.service
echo 'KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"' | doas tee /etc/udev/rules.d/85-sunshine.rules
doas setcap cap_sys_admin+p $(readlink -f $(which sunshine))
systemctl enable smb.service
doas smbpasswd -a $(whoami)

#Packages
paru -S brave-bin davinci-resolve easyeffects kate krita less libreoffice-still lsp-plugins calf noto-fonts-cjk noto-fonts-emoji qbittorrent shutter-encoder-bin kotatogram-desktop upscayl vesktop-bin vlc vscodium yandex-browser ark dolphin kio-admin --needed

#Cleanup
paru -Qtdq | paru -Rns -
doas paccache -r
doas paccache -rk1
paru -Sc
