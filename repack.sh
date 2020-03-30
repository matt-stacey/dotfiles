#!/bin/bash -v
clear

# copies vim files into this repo
echo 'diff ~/.vimrc .vimrc'
diff ~/.vimrc .vimrc
echo 'move?'
read move
if [[ $move -eq 'y' ]]
then
    cp ~/.vimrc .vimrc
fi
clear


# copies emacs files into this repo
echo 'diff ~/.emacs .emacs'
diff ~/.emacs .emacs
echo 'move?'
read move
if [[ $move -eq 'y' ]]
then
    cp ~/.emacs .emacs
fi
clear


# copies bash files into this repo
echo 'diff ~/.bashrc .bashrc'
diff ~/.bashrc .bashrc
echo 'move?'
read move
if [[ $move -eq 'y' ]]
then
    cp ~/.bashrc .bashrc
fi
clear

echo 'diff ~/.bash_aliases .bash_aliases'
diff ~/.bash_aliases .bash_aliases
echo 'move?'
read move
if [[ $move -eq 'y' ]]
then
    cp ~/.bash_aliases .bash_aliases
fi


# source files



# run scripts

