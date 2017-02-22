#!/bin/bash

# soft link for vim

PACAKGE=("texlive" "vim" "subversion" "openssh-server" "tmux" "exuberant-ctags" "tree")
TARGET=(".vimrc" ".bashrc" ".vim" ".subversion" ".ssh" ".tmux.conf")

for t in ${TARGET[@]}; do
    rm -rf $HOME/$t
    ln -s $PWD/$t $HOME/$t
    echo $t" is changed"
done

sudo apt-get install subversion

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +BundleInstall +qall
