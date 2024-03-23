#!/bin/bash

mkdir -p ~/dotfiles/vimfiles

ln -s ~/dotfiles/.gitignore ~/.agignore
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# neovim
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/_vimrc  ~/.config/nvim/init.lua
ln -s ~/dotfiles/nvim/lua ~/.config/nvim/lua
ln -s ~/dotfiles/nvim/plugin ~/.config/nvim/plugin
ln -s ~/dotfiles/nvim/snippets ~/.config/nvim/snippets 
