#!bin/bash

# Update
pacman -Syu

# Install development packages
pacman -S --noconfirm base-devel git nano curl wget intltool

# Install network packages
pacman -S --noconfirm bluez bluez-utils networkmanager network-manager-applet wpa_supplicant avahi inetutils nss-mdns cups

# Installig tools
pacman -S --noconfirm xdg-user-dirs xdg-utils pipewire pipewire-pulse pipewire-alsa easyeffects udiskie udisks2 xarchiver pcmanfm gvfs gvfs-smb gvfs-afc ntfs-3g bash bash-completion rsync rclone flatpak terminus-font

# Nvidia proprietary drivers and tools
pacman -S --noconfirmnvidia nvidia-utils nvidia-settings xorg 

# Enable basic services
systemctl enable sshd
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable avahi-deamon
systemctl enable cups.service

# Purge cache
pacman -Scc