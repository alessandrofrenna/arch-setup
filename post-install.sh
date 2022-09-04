#!/bin/bash

# Fonts
sudo pacman -S --noconfirm noto-fonts ttf-roboto ttf-ubuntu-font-family ttf-fira-mono ttf-hack ttf-fira-code \
ttf-jetbrains-mono ttf-opensans noto-fonts-cjk noto-fonts-emoji ttf-font-awesome ttf-nerd-fonts-symbols-1000-em \
ttf-nerd-fonts-symbols-1000-em-mono  ttf-nerd-fonts-symbols-2048-em  ttf-nerd-fonts-symbols-2048-em-mono



# Lightdm
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings 

# Basic software installation
sudo pacman -S --noconfirm firefox thunderbird ffmpeg mpv reflector lxappearance archlinux-wallpaper bitwarden neofetch
sudo flatpak install -y spotify

# Update mirrorlist
sudo reflector -c Italy, -a 10 --sort rate --protocol https --save /etc/pacman.d/mirrorlist

# Enable services
sudo systemctl enable lightdm
sudo systemctl enable reflector.timer

# Install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
rm -rf yay
cd ..

# Install packages from AUR
yay -S --noconfirm pix
yay -S --noconfirm ly

# Purge cache
pacman -Scc --noconfirm
yay -Scc --noconfirm