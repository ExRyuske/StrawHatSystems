#Configs
sudo cp -r StrawHatLinux/etc /
#sudo cp -r StrawHatLinux/usr /

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
paru -S jdk-temurin jdk17-temurin noto-fonts hdparm

#Kernel (TKG + Generate GRUB)
paru -S linux-lts-tkg-eevdf linux-lts-tkg-eevdf-headers
paru -Rs linux
doas grub-mkconfig -o /boot/grub/grub.cfg

#Graphics drivers (AMD)
paru -S mesa lib32-mesa vulkan-radeon lib32-vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver rocm-opencl-runtime --needed

#Audio (PipeWire)
paru -S pipewire lib32-pipewire wireplumber pipewire-audio pipewire-alsa pipewire-pulse pipewire-jack lib32-pipewire-jack --needed

#Desktop environment (Gnome + Wayland)
paru -S plasma plasma-wayland-session konsole spectacle ark dolphin kio-admin unrar p7zip --needed
systemctl enable sddm.service

#Python (Pip + OBS)
cd
paru -S python-pip obs-studio-tytan652 obs-pipewire-audio-capture-bin
python -m venv obsws
obsws/bin/python -m pip install obsws-python

#Gaming
paru -S steam proton-ge-custom-bin protontricks gamemode lib32-gamemode goverlay heroic-games-launcher-bin prismlauncher --needed
doas usermod -aG gamemode $(whoami)

#External drives
doas mkdir /mnt/games
doas chmod -R 777 /mnt/games
echo 'LABEL=Games /mnt/games ext4 defaults 0 0' | doas tee -a /etc/fstab
doas mkdir /mnt/media
doas chmod -R 777 /mnt/media
echo 'LABEL=Media /mnt/media ext4 defaults 0 0' | doas tee -a /etc/fstab

#Server (ZeroTier + Sunshine + Samba)
paru -S zerotier-one sunshine samba --needed
systemctl enable zerotier-one.service
echo 'KERNEL=="uinput", SUBSYSTEM=="misc", OPTIONS+="static_node=uinput", TAG+="uaccess"' | doas tee /etc/udev/rules.d/85-sunshine.rules
doas setcap cap_sys_admin+p $(readlink -f $(which sunshine))
systemctl --user enable sunshine
systemctl enable smb.service
doas smbpasswd -a $(whoami)

#Packages
paru -S brave-bin easyeffects kate krita less libreoffice-still lsp-plugins calf noto-fonts-cjk noto-fonts-emoji qbittorrent shutter-encoder-bin kotatogram-desktop upscayl vesktop-bin vscodium yandex-browser --needed

#Cleanup
paru -Qtdq | paru -Rns -
doas paccache -r
doas paccache -rk1
paru -Sc
