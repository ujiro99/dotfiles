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

# brew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install git
brew install fish
brew install cmigemo
brew install nodebrew
brew install pyenv
brew install pyenv-pip-rehash
brew install homebrew/boneyard/pyenv-pip-rehash
brew install tig
brew install go
brew install ripgrep
brew install global --with-exuberant-ctags --with-pygments
brew install ghq fzf
brew install neovim
brew tap caskroom/cask
brew cask install iterm2
brew cask install lastpass-universal
brew cask install betterzipql
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json
brew cask install qlcolorcode
brew cask install qlvideo
nodebrew install-binary stable

# fish
chsh -s /usr/local/bin/fish
ln -s ~/dotfiles/.fishrc ~/.config/fish/config.fish
curl -Lo  ~/.config/fish/functions/fisher.fish --create-dirs git.io/fisher
fisher z fzf decors/fish-ghq rafaelrinaldi/pure
