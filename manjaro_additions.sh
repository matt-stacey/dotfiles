#!/bin/bash

# These have already been done if you made it this far:
# pacman -S git
# git clone https://github.com/matt-stacey/dotfiles.git

# Make sure we are up to date
pacman -Syyu

# Install minimums to operate; Ensure GRUB is up-to-date with all OSes
pacman -S opera vim terminator sudo which iw wpa_supplicant dhcpcd iwd grub efibootmgr os-prober
os-prober
grub-mkconfig -o /boot/grub/grub.cfg

# Install some software
pacman -S byobu sshfs openvpn firefox python python3 python-pip evince code htop powertop iotop tlp vlc redshift libreoffice-still wine play-on-linux steam lib32-nvidia-utils lib32-mesa ttf-liberation openra gcompris-qt
tlp start
systemctl enable tlp.service

# Reboot
echo 'press enter to reboot or ctrl-C to exit'
read
shutdown -r now

# Install drivers
pacman -S nvidia
