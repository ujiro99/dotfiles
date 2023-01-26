# Source global definitions
[ -s /etc/bashrc ] && . /etc/bashrc

# path
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin
[ -s ~/.bashrc.local ] && . ~/.bashrc.local

# 新しく作られたファイルのパーミッションを644をデフォルトにする
umask 022

# coreファイルを作らないようにする
ulimit -c 0

## シェル変数
# プロンプト文字列の設定
PS1='\[\033[0;34m\][\t \w]\n\[\033[0m\]\$ '
# コマンド履歴のサイズ
HISTSIZE=50000
HISTFILESIZE=50000
# 重複履歴を無視
export HISTCONTROL=ignoreboth:erasedups
# 履歴保存対象から外す
export HISTIGNORE="fg*:bg*:history*:wmctrl*:exit*:ls -al:cd ~"
# コマンド履歴にコマンドを使ったの時刻を記録する
export HISTTIMEFORMAT='%Y%m%d %T '

set -o ignoreeof
unset autologout

export TMPDIR=/tmp
export MAKE_MODE=unix

## タイムゾーンの指定
export TZ=JST-9
## デフォルトのページャをlessにする
export PAGER=less
## lessのステータス行にファイル名と行数、％を表示する
export LESS='-X -r -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'

## Alias 一覧
alias j=jobs
alias vi="vim"
alias c=cd
alias u="cd ../"
alias uu="cd ../../"
alias uuu="cd ../../../"
alias g="git"

export LS_OPTIONS='--color=auto'
alias ls='ls $LS_OPTIONS -a'
alias ll='ls $LS_OPTIONS -la'
alias l='ls $LS_OPTIONS -lA'

alias vi=/usr/local/bin/nvim

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## fzf
export FZF_DEFAULT_COMMAND='rg --hidden --ignore .git -g ""'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## fzf & ghq
function fzf_ghq() {
  local project_name=$(ghq list | sort | $(__fzfcmd))
  if [ -n "$project_name" ]; then
    local project_full_path=~/src/$project_name
    cd $project_full_path
    echo $project_full_path
  fi
}
bind -x '"\C-g": fzf_ghq'
function fzf_z() {
  local res=$(z | sort -rn | cut -c 12- | fzf)
  if [ -n "$res" ]; then
    cd $res
    echo $res
  else
    return 1
  fi
}
bind -x '"\C-j": fzf_z'

# nodenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"

# z
source "$HOME/z/z.sh"
