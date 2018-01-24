#!/bin/bash

# soft link for vim

PACAKGE=("texlive" "vim" "subversion" "openssh-server" "tmux" "exuberant-ctags" "tree")
TARGET=(".vimrc" ".bash_profile" ".bashrc" ".vim" ".subversion" ".ssh" ".tmux.conf")

for t in ${TARGET[@]}; do
    rm -rf $HOME/$t
    ln -s $PWD/$t $HOME/$t
    echo $t" is changed"
done

sudo apt-get install subversion
sudo apt-get install vim

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone https://github.com/will133/vim-dirdiff.git ~/.vim/bundle/
#vim +PluginInstall +qall
