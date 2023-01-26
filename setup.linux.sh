#!/bin/bash

mv ~/.bashrc ~/.bashrc.bak

mkdir -p ~/dotfiles/vimfiles

ln -s ~/dotfiles/.gitignore ~/.agignore
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gtagsrc ~/.gtagsrc
ln -s ~/dotfiles/.ctagsignore ~/.ctagsignore
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimfiles ~/.vim
ln -s ~/dotfiles/.bashrc ~/.bashrc

mkdir ~/.vim/backup
mkdir ~/.vim/swap
mkdir ~/.vim/undo

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# z
git clone --depth 1 https://github.com/rupa/z.git
source z/z.sh

# neovim
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors
ln -sf ~/dotfiles/_vimrc  ~/.config/nvim/init.vim
ln -s  ~/dotfiles/vimfiles/after/ftplugin ~/.config/nvim/ftplugin
ln -s  ~/dotfiles/vimfiles/ftdetect ~/.config/nvim/ftdetect
ln -s  ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json

