## Alias 一覧
alias vi=nvim
alias c=cd
alias u="cd ../"
alias uu="cd ../../"
alias uuu="cd ../../../"
alias g="git"

export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS -a'
alias ll='ls $LS_OPTIONS -la'
alias l='ls $LS_OPTIONS -lA'

# Brew
eval $(/opt/homebrew/bin/brew shellenv)

# Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Python
export PYTHON_PATH=$HOME/Library/Python/3.9
export PATH=$PATH:$PYTHON_PATH/bin

# Rust
. "$HOME/.cargo/env"

# neovim
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# fzf
source $HOME/dotfiles/zsh/fzf-ghq.zsh
source $HOME/dotfiles/zsh/fzf-history.zsh

# zoxide
eval "$(zoxide init zsh)"
