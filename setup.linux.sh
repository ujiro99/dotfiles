#!/bin/bash

mv ~/.bashrc ~/.bashrc.bak

ln -s ~/dotfiles/.gitignore ~/.agignore
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gtagsrc ~/.gtagsrc
ln -s ~/dotfiles/.ctagsignore ~/.ctagsignore
ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_gvimrc ~/.gvimrc
ln -s ~/dotfiles/tslint.json ~/tslint.json
ln -s ~/dotfiles/vimfiles ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.bashrc ~/.bashrc

mkdir ~/.vim/backup
mkdir ~/.vim/swap
mkdir ~/.vim/undo

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

