#Packages
flatpak install com.brave.Browser
flatpak install org.qbittorrent.qBittorrent
flatpak install io.github.tdesktop_x64.TDesktop
flatpak install net.davidotek.pupgui2
flatpak install xyz.armcord.ArmCord
flatpak install com.github.Matoking.protontricks
flatpak install com.github.tchx84.Flatseal
flatpak install org.videolan.VLC
flatpak install com.moonlight_stream.Moonlight
flatpak install com.heroicgameslauncher.hgl
curl -L https://github.com/SteamDeckHomebrew/decky-installer/releases/latest/download/install_release.sh | sh
curl -O https://raw.githubusercontent.com/CryoByte33/steam-deck-utilities/main/InstallCryoUtilities.desktop
mv "InstallCryoUtilities.desktop" "$HOME"/Desktop
chmod +x "$HOME"/Desktop/InstallCryoUtilities.desktop
