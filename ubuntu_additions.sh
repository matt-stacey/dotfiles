#!/bin/bash

# These have already been done if you made it this far:
# apt install git
# git clone --depth 1 https://github.com/matt-stacey/dotfiles.git

# Make sure we are up to date
echo 'Updating system'
apt update && apt upgrade -y && apt autoremove

# Install minimums to operate; Ensure GRUB is up-to-date with all OSes
echo 'Installing basics'
apt install vim terminator sudo iw wpasupplicant dhcpcd5 iwd grub2 efibootmgr os-prober
os-prober
grub-mkconfig -o /boot/grub/grub.cfg

# Install some software
echo 'Installing chosen software'
apt install byobu sshfs openvpn python2 python3 python3-pip evince htop iotop vlc redshift libreoffice
apt install software-properties-common apt-transport-https wget curl
# Brave
curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | tee /etc/apt/sources.list.d/brave-browser-release.list
# VS Code
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
# Install them
apt update && apt install brave-browser code


# Reboot
echo 'Done!'
echo 'Press enter to reboot or ctrl-C to exit'
read
shutdown -r now

# Additional non-package software
# Pycharm: https://www.jetbrains.com/pycharm/download/#section=linux$
# APM: https://ardupilot.org/planner2/docs/installation-for-linux.html#installation-for-linux

# see linux.notes for settings setup
