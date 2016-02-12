#!/bin/bash

# install Homebrew
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
brew install git

mkdir ~/dotfiles/vimfiles

ln -s ~/dotfiles/.gitignore ~/.gitignore
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

# vi
git clone https://github.com/Shougo/neobundle.vim ~/dotfiles/vimfiles/bundle/neobundle.vim

## prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh
echo "source ~/dotfiles/.zshrc" >> ~/.zshrc

# brew
brew install cmigemo
brew install nodebrew
brew install pyenv
brew install pyenv-pip-rehash
brew install homebrew/boneyard/pyenv-pip-rehash
brew install tig
brew install z
brew install go
brew install pt
brew install caskroom/cask/brew-cask
brew install global --with-exuberant-ctags --with-pygments
brew cask install iterm2
brew cask install keyremap4macbook
brew cask install lastpass-universal
brew cask install betterzipql
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json
nodebrew install-binary stable

# go
go get github.com/lestrrat/peco/cmd/peco/
