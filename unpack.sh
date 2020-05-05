#!/bin/bash -v

# Config flags
BASH=1
VIM=1

# Appearance flags
THEMES=1
GRUB=0
LIGHTDM=0

# Install flags
MANJARO=0
ARCH_CUSTOM=0

# Consume args and set flags
while (( $# )); do

    case $1 in
        --no-bash)
            BASH=0
            ;;
        --no-vim)
            VIM=0
            ;;
        --no-themes)
            THEMES=0
            ;;
        --grub)
            GRUB=1
            ;;
        --lightdm)
            LIGHTDM=1
            ;;
        --manjaro-install)
            MANJARO=1
            ;;
        --arch-custom)
            ARCH_CUSTOM=1
        --print_next)
            echo 'here it is: '$2
            shift
            ;;
        --*)
            echo 'bad option: '$1
            ;;
        -*)
            echo 'not parsed: '$1
            ;;
    esac
    shift
done

# Unpack configs
if [ $BASH ]
then
    echo 'unpacking bashrc and aliases'
    cp ./HOME/.bashrc ~/.bashrc
    cp ./HOME/.bash_profile ~/.bash_profile
    cp ./HOME/.bash_aliases ~/.bash_aliases
else
    echo 'bashrc and aliases skipped!'
fi

if [ $VIM ]
then
    echo 'unpacking vim config and color schemes'
    cp ./HOME/.vimrc ~/.vimrc
    mkdir -p ~/.vim/colors
    cp -r ./HOME/.vim/colors ~/.vim
else
    echo 'vim config and color schemes skipped!'
fi

# Unpack theming
if [ $THEMES ]
then
    echo 'unpacking themes, icons, and cursors'
    cp ./HOME/.icons ~/.icons
    cp ./HOME/.themes ~/.themes
else
    echo 'themes, icons, and cursors skipped!'
fi
if [ $GRUB ]
then
    echo 'unpacking GRUB theme'

else
    echo 'GRUB skipped!'
fi

if [ $LIGHTDM ]
then
    echo 'unpacking LightDM theme'

else
    echo 'LightDM skipped!'
fi

# Desired setup
if [ $MANJARO ]
then
    echo 'Installing additional packages to Manjaro install'
    sudo bash manjaro_additions.sh
elif [ $ARCH_CUSTOM ]  # mutually exclusive; Manjaro prioritized
    echo 'Installing additional packages to bare Arch install'
    sudo bash arch_custom.sh
fi
