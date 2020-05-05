#!/bin/bash -v


## copies vim files from this repo
#echo 'copying .vimrc'
#cp .vimrc ~/.vimrc
#
#echo 'copying vim color schemes'
#mkdir -p ~/.vim/colors
#cp -r ./.vim/colors ~/.vim
#
#
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

else
    echo 'bashrc and aliases skipped!'
fi

if [ $VIM ]
then
    echo 'unpacking vim config and color schemes'
    
else
    echo 'vim config skipped!'
fi

if [ $THEMES ]
then
    echo 'unpacking themes'

else
    echo 'themes skipped!'
fi
