#Remove old conf
sudo rm -r /etc/ld.so.conf.d/fakeroot.conf /etc/ld.so.conf.d/lib32-fakeroot.conf
sudo rm -r /etc/security/limits.d/10-games.conf

#Pacman + Paru
sudo pacman-key --init
sudo pacman-key --populate

#Packages 
sudo pacman -S archlinux-keyring base-devel multilib-devel openssl
paru -Sy proton-ge-custom-bin
