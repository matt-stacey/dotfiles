#!/bin/bash -v

# Starting point
DIR='.'

# Config flags
BASH=1
VIM=1

# Appearance flags
THEMES=1
GRUB=
LIGHTDM=

# Install flags
MANJARO=
ARCH_CUSTOM=

DEFAULTS='bashrc/aliases, vim settings, themes; no grub, no menu, no manjaro/arch packages'

if [ $# -lt 1 ]
then
    echo 'No args passed; press Enter to proceed with the defaults: '$DEFAULTS
    read
fi


# Consume args and set flags
while (( $# )); do

    case $1 in
        --no-bash)
            BASH=
            ;;
        --no-vim)
            VIM=
            ;;
        --no-themes)
            THEMES=
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
            ;;
        --osr)  # allow osr-tools-and-scripts to unpack bash/vim settings
            DIR='../dotfiles'
            THEMES=
            ;;
        --*)
            echo 'Bad option: '$1
            ;;
        *)
            echo 'Not parsed: '$1
            ;;
    esac
    shift
done

# Unpack configs
if [ $BASH ]
then
    echo 'Unpacking bashrc and aliases'
    cp $DIR/HOME/.bashrc ~/.bashrc
    cp $DIR/HOME/.bash_profile ~/.bash_profile
    cp $DIR/HOME/.bash_aliases ~/.bash_aliases
else
    echo 'bashrc and aliases skipped!'
fi

if [ $VIM ]
then
    echo 'Unpacking vim config and color schemes'
    cp $DIR/HOME/.vimrc ~/.vimrc
    mkdir -p ~/.vim
    cp -r $DIR/HOME/.vim ~
else
    echo 'vim config and color schemes skipped!'
fi

# Unpack theming
if [ $THEMES ]
then
    echo 'Unpacking themes, icons, and cursors'
    cp -r ./HOME/.icons ~
    cp -r ./HOME/.themes ~
else
    echo 'Themes, icons, and cursors skipped!'
fi
if [ $GRUB ]
then
    echo 'Unpacking GRUB theme and updating GRUB'
    sudo cp -r ROOT/usr/share/grub/themes/elite /usr/share/grub/themes
    sudo cp -a /etc/default/grub /etc/default/grub.bak
    echo 'Add the following lines to GRUB config:'
    echo 'GRUB_GFXMODE=1920x1080'
    echo 'GRUB_THEME="/usr/share/grub/themes/elite/theme.txt"'
    read
    sudo vi /etc/default/grub
    sudo update-grub
else
    echo 'GRUB skipped!'
fi

if [ $LIGHTDM ]
then
    echo 'Unpacking LightDM theme'

else
    echo 'LightDM skipped!'
fi

# Desired setup
if [ $MANJARO ]
then
    echo 'Installing additional packages to Manjaro install'
    sudo bash manjaro_additions.sh
elif [ $ARCH_CUSTOM ]  # mutually exclusive; Manjaro prioritized
then
    echo 'Installing additional packages to bare Arch install'
    sudo bash arch_custom.sh
fi
