#!/bin/bash -v

# copies vim files into this repo
echo 'diff ~/.vimrc HOME/.vimrc'
diff ~/.vimrc HOME/.vimrc
echo 'move?'
read move
if [ "$move" == "y" ]
then
    cp ~/.vimrc HOME/.vimrc
fi


# copies bash files into this repo
echo 'diff ~/.bashrc HOME/.bashrc'
diff ~/.bashrc HOME/.bashrc
echo 'move?'
read move
if [ "$move" == "y" ]
then
    cp ~/.bashrc HOME/.bashrc
fi

echo 'diff ~/.bash_aliases HOME/.bash_aliases'
diff ~/.bash_aliases HOME/.bash_aliases
echo 'move?'
read move
if [ "$move" == "y" ]
then
    cp ~/.bash_aliases HOME/.bash_aliases
fi

echo 'diff ~/.bash_profile HOME/.bash_profile'
diff ~/.bash_profile HOME/.bash_profile
echo 'move?'
read move
if [ "$move" == "y" ]
then
    cp ~/.bash_profile HOME/.bash_profile
fi


# source files



# run scripts

