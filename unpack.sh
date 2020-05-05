#!/bin/bash -v

## copies bash files from this repo
#echo 'copying .bashrc'
#cp .bashrc ~/.bashrc
#
#echo 'copying bash aliases'
#cp .bash_aliases ~/.bash_aliases
#
#
## source files
#
#
#
## run scripts
#

# init flags
GRUB=0
LIGHTDM=0
BASH=1
VIM=1
THEMES=1

# consume args and set flags
while (( $# )); do

    case $1 in
        --grub)
            GRUB=1
            ;;
        --lightdm)
            LIGHTDM=1
            ;;
        --no-bash)
            BASH=0
            ;;
        --no-vim)
            VIM=0
            ;;
        --no-themes)
            THEMES=0
            ;;
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

# unpack as requested
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

if [ $THEMES ]
then
    echo 'unpacking themes'

else
    echo 'themes skipped!'
fi
