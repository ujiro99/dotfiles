# Source global definitions
[ -s /etc/bashrc ] && . /etc/bashrc

# path
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin:/usr/share/doc/git/contrib/diff-highlight
[ -s ~/dotfiles/.bashrc.peco ] && . ~/dotfiles/.bashrc.peco
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

## fzf
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
