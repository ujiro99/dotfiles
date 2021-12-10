#!/bin/bash

mkdir -p ~/dotfiles/vimfiles

ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gtagsrc ~/.gtagsrc
ln -s ~/dotfiles/.ctagsignore ~/.ctagsignore
ln -s ~/dotfiles/_vimrc ~/.vimrc
ln -s ~/dotfiles/_gvimrc ~/.gvimrc
ln -s ~/dotfiles/.xvimrc ~/.xvimrc
ln -s ~/dotfiles/.ideavimrc ~/.ideavimrc
ln -s ~/dotfiles/tslint.json ~/tslint.json
ln -s ~/dotfiles/vimfiles ~/.vim
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

# neovim
mkdir -p ~/.config/nvim
mkdir -p ~/.config/nvim/colors
ln -sf ~/dotfiles/_vimrc  ~/.config/nvim/init.vim
ln -s  ~/dotfiles/vimfiles/after/ftplugin ~/.config/nvim/ftplugin
ln -s  ~/dotfiles/vimfiles/ftdetect ~/.config/nvim/ftdetect
ln -s  ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json

# brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew install git
brew install tmux
brew install fish
brew install cmigemo
brew install nodenv
brew install pyenv
brew install pyenv-virtualenv
brew install tig
brew install go
brew install wget
brew install ripgrep
brew install global --with-exuberant-ctags --with-pygments
brew install ghq fzf
brew install neovim
brew install cask
brew install jq
brew cask install iterm2

# fish
chsh -s /usr/local/bin/fish
ln -s ~/dotfiles/.fishrc ~/.config/fish/config.fish
ln -s ~/dotfiles/fishfile ~/.config/fish/fish_plugins
curl -Lo  ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher update

# change key speed
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 1
