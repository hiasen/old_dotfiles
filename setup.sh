#!/bin/sh

echo "Installing dotfiles"

if [ -d ~/.oh-my-zsh ]
then
    echo "Oh my zsh is already installed"
else
    echo "Cloning oh-my-zsh-repo"
    git clone https://github.com/hiasen/oh-my-zsh.git ~/.oh-my-zsh
fi

if [ -d ~/.dotfiles/vim/bundle/vundle ]
then
    echo "Vundle is already installed"
else
    echo "Cloning vundle-repo"
    git clone https://github.com/gmarik/vundle.git ~/.dotfiles/vim/bundle/vundle
fi

python ~/.dotfiles/makesymlinks.py
