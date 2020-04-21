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

# Get rid of old VI and simlink to VIM
pacman -R vi
cd /usr/bin
ln -s vim vi
cd -

# Install some software
pacman -S byobu sshfs openvpn firefox python python3 python-pip evince code htop powertop iotop tlp vlc redshift libreoffice-still wine playonlinux steam lib32-nvidia-utils lib32-mesa ttf-liberation openra gcompris-qt openscad xscreensaver
tlp start
systemctl enable tlp.service

# Reboot
echo 'press enter to reboot or ctrl-C to exit'
read
shutdown -r now

# Additional non-package software
# Pycharm: https://www.jetbrains.com/pycharm/download/#section=linux$
# APM: https://ardupilot.org/planner2/docs/installation-for-linux.html#installation-for-linux

# see linux.notes for settings setup

# Install drivers
pacman -S nvidia
