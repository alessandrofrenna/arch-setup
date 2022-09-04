#!bin/bash

# Fonts
sudo pacman -S --noconfirm noto-fonts ttf-roboto ttf-ubuntu-font-family ttf-fira-mono ttf-hack ttf-fira-code ttf-jetbrains-mono ttf-opensans noto-fonts-cjk noto-fonts-emoji ttf-font-awesome ttf-nerd-fonts-*

# Lightdm
sudo pacman -S --noconfirm lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings 

# Basic software installation
sudo pacman -S --noconfirm firefox thunderbird ffmpeg mpv reflector lxappearance archlinux-wallpaper bitwarden neofetch xpdf
sudo flatpak install -y spotify

# Update mirrorlist
sudo reflector -c Italy, -a 10 --sort rate --protocol https --save /etc/pacman.d/mirrorlist

# Enable services
sudo systemctl enable lightdm
systemctl enable reflector.service
systemctl enable reflector.timer

# Install yay
cd /tmp
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
pacman -Scc
yay -Scc