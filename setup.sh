#!/bin/bash

ln -s ~/dotfiles/.gitignore ~/.agignore
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# neovim
mkdir -p ~/.config/nvim
ln -sf ~/dotfiles/init.lua ~/.config/nvim/init.lua
ln -s ~/dotfiles/nvim/lua ~/.config/nvim/lua
ln -s ~/dotfiles/nvim/plugin ~/.config/nvim/plugin
ln -s ~/dotfiles/nvim/snippets ~/.config/nvim/snippets

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install git
brew install tmux
brew install tig
brew install go
brew install wget
brew install ripgrep
brew install ghq fzf
brew install neovim
brew install jq
brew install fd
brew install stylua

# change key speed
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
