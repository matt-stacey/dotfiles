#!/bin/bash

# These have already been done if you made it this far:
# pacman -S git
# git clone https://github.com/matt-stacey/dotfiles.git

systemctl enable wpa_supplicant@wlan0
systemctl enable dhcpcd

# Make sure we are up to date
pacman -Syyu

# Install minimums to operate
pacman -S opera vim terminator sudo which
pacman -S ip iw wpa_supplicant dhcpcd iwd

# Ensure GRUB is up-to-date with all OSes
pacman -S grub efibootmgr os-prober
os-prober
grub-mkconfig -o /boot/grub/grub.cfg

# Install Xorg
pacman -S Xorg

# Install LightDM
pacman -S lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings
echo 'Update the following in vim /etc/lightdm/lightdm.conf: greeter-session=lightdm-gtk-greeter'
read
vim /etc/lightdm/lightdm.conf
systemctl enable lightdm

# Install Xfce
pacman -S xfce4 xfce4-goodies xfce4-pulseaudio-plugin xdg-user-dirs xscreensaver

# Install drivers
pacman -S nvidia alsa-utils pulseaudio pulseaudio-alsa pulseaudio-jack

# Install some software
pacman -S byobu sshfs openvpn firefox python python3 python-pip evince code
pacman -S htop powertop iotop tlp
pacman -S vlc redshift libreoffice-still
pacman -S wine play-on-linux steam lib32-nvidia-utils lib32-mesa ttf-liberation openra gcompris-qt
tlp start
systemctl enable tlp.service

# Reboot
echo 'press enter to reboot or ctrl-C to exit'
read
shutdown -r now