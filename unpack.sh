#!/bin/bash -v


# copies vim files from this repo
echo 'copying .vimrc'
cp .vimrc ~/.vimrc

echo 'copying vim color schemes'
mkdir -p ~/.vim/colors
cp -r ./.vim/colors ~/.vim


# copies bash files from this repo
echo 'copying .bashrc'
cp .bashrc ~/.bashrc

echo 'copying bash aliases'
cp .bash_aliases ~/.bash_aliases


# source files



# run scripts

