#!/bin/bash

mkdir ~/dotfiles/vimfiles
mkdir ~/.zsh

ln -s ~/dotfiles/.gitignore ~/.gitignore
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.gtagsrc ~/.gtagsrc
ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_gvimrc ~/.gvimrc
ln -s ~/dotfiles/.xvimrc ~/.xvimrc
ln -s ~/dotfiles/vimfiles ~/.vim

git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/vimfiles/bundle/neobundle.vim
git clone https://github.com/Shougo/vimproc ~/dotfiles/vimfiles/bundle/vimproc
git clone https://github.com/rupa/z.git ~/.zsh/z
git clone https://github.com/zsh-users/zsh-completions.git ~/.zsh/zsh-completions

