#users generic .zshrc file for zsh(1)

## Environment variable configuration
#
# LANG
export LANG=ja_JP.UTF-8
case ${UID} in
0)
    LANG=C
    ;;
esac


## color scheme
#[ -f ${HOME}/dotfiles/.zshrc.color ] && source ${HOME}/dotfiles/.zshrc.color

## vi Status bar
#[ -f ${HOME}/dotfiles/.zshrc.vimode ] && source ${HOME}/dotfiles/.zshrc.vimode

# show git branch
[ -f ${HOME}/dotfiles/.zshrc.git.showbranch ] && source ${HOME}/dotfiles/.zshrc.git.showbranch

## git status & completion
#[ -f ${HOME}/dotfiles/.zshrc.git ] && source ${HOME}/dotfiles/.zshrc.git


## Default shell configuration
#
# set prompt
autoload -Uz colors
colors
case ${UID} in
0)
    PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') %B%{${fg[red]}%}[%/]
#%{${reset_color}%}%b "
    PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
    SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
    ;;
*)
    PROMPT="%{${fg[blue]}%}[%/]%{${reset_color}%}
$ "
    PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
    SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
    [ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
        PROMPT="%{${fg[cyan]}%}$(echo ${HOST%%.*} | tr '[a-z]' '[A-Z]') ${PROMPT}"
    ;;
esac


# PATH setting
PATH=${HOME}/bin:/usr/local/bin:${PATH}
PATH=${PATH}:/Applications/Xcode.app/Contents/Developer/usr/bin

# rvmへのパスを通す
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# rbenvの読み込み
eval "$(rbenv init -)"
source /usr/local/Cellar/rbenv/0.3.0/completions/rbenv.zsh


# auto change directory
setopt auto_cd

# cdで移動してもpushdと同じようにディレクトリスタックに追加する。
setopt auto_pushd
# カレントディレクトリ中に指定されたディレクトリが見つからなかった場合に
# 移動先を検索するリスト。
cdpath=(~)
# ディレクトリが変わったらディレクトリスタックを表示。
chpwd_functions=($chpwd_functions dirs)

# command correct edition before each completion attempt
setopt correct

# compacked complete list display
setopt list_packed

# no remove postfix slash of command line
setopt noautoremoveslash

# no beep sound
setopt nobeep

# no beep sound when complete list displayed
setopt nolistbeep

## Keybind configuration
# vim like keybind
bindkey -v


# historical backward/forward search with linehead string binded to ^P/^N
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^p" history-beginning-search-backward-end
bindkey "^n" history-beginning-search-forward-end
bindkey "\\ep" history-beginning-search-backward-end
bindkey "\\en" history-beginning-search-forward-end


# reverse menu completion binded to Shift-Tab
bindkey "\e[Z" reverse-menu-complete


## Command history configuration
HISTFILE=${HOME}/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data


# 補完設定ファイルを読み込む
fpath=(${HOME}/.zsh/functions/Completion ${fpath})
autoload -U compinit
compinit


# 補完スタイルの改善
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'


# TAB 補完時に大文字小文字無視
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' menu select=1


## Prediction configuration
#autoload predict-on
#predict-on


## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases     # aliased ls needs if file/dir completions work

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    alias ll="ls -lh"
    alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
    alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
    alias vl="/Applications/VLC.app/Contents/MacOS/VLC --intf=rc"
    alias less="/Applications/MacVim.app/Contents/Resources/vim/runtime/macros/less.sh"
    alias mp="mplayer"
    alias dt="dotcloud"
    ;;
linux*)
    alias ls="ls --color"
    ;;
cygwin*)
    alias ls="ls --color"
    alias cdd="cd ~/Desktop/"
    alias cd/="cd /cygdrive/c/"
    alias fk="taskkill /f /im"
    alias a="adb"
    alias ad="adb devices"
    alias al="adb logcat -v time"
    alias tcpdump="windump"
    alias apt="apt-cyg -m ftp://ftp.iij.ad.jp/pub/cygwin/"
    alias st="cygstart"
    alias gtags="gtags -v --gtagsconf /glo622wb/share/gtags/gtags.conf"
    alias htags="htags -sanovwF"
esac

alias where="command -v"
alias c="cd"
alias l="ls -a"
alias la="ls -a"
alias lf="ls -F"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias sc="screen"
alias pw="pwd"
alias g="git"
alias gst="git st -s -b && git stash list"
alias grep="grep -in"
alias u="../"
alias uu="../../"
alias uuu="../../../"
alias :q="exit"

# grep デフォルトオプションの設定
export GREP_OPTIONS
# バイナリファイルにはマッチさせない。
GREP_OPTIONS="--binary-files=without-match"
## grep対象としてディレクトリを指定したらディレクトリ内を再帰的にgrepする。
#GREP_OPTIONS="--directories=recurse $GREP_OPTIONS"
# 拡張子が.tmpのファイルは無視する。
GREP_OPTIONS="--exclude=\*.tmp $GREP_OPTIONS"
# 管理用ディレクトリを無視する。
GREP_OPTIONS="--exclude-dir=.svn $GREP_OPTIONS"
GREP_OPTIONS="--exclude-dir=.git $GREP_OPTIONS"
GREP_OPTIONS="--exclude-dir=.deps $GREP_OPTIONS"
GREP_OPTIONS="--exclude-dir=.libs $GREP_OPTIONS"
# 色を付ける。
GREP_OPTIONS="--color=auto $GREP_OPTIONS"
# 色を赤にする。
export GREP_COLOR="0:31"

# terminal configuration
case "${TERM}" in
screen)
    TERM=xterm
    ;;
esac

case "${TERM}" in
xterm|xterm-color)
    export LSCOLORS=exfxcxdxbxegedabagacad
    export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
    zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'
    ;;
esac


# Less Color Syntax with source-highlight
# export LESS='-R'
# export LESSOPEN='| /usr/local/bin/src-hilite-lesspipe.sh %s'


# set terminal title including current directory
    #case "${TERM}" in
#xterm|xterm-color|kterm|kterm-color)
#    precmd() {
#        echo -ne "\034]0;${USER}@${HOST%%.*}:${PWD}\007"
#    }
#    ;;
#esac


setopt hist_ignore_space
bindkey -s '^z' '^[q %vi^m'


# cd履歴のジャンプ
_Z_CMD=j
_Z_DATA=${HOME}/.zsh/z/.z
if [ -f ${HOME}/.zsh/z/z.sh ]; then
    source  ${HOME}/.zsh/z/z.sh
    precmd() {
      _z --add "$(pwd -P)"
    }
fi



# cd履歴のジャンプ
#if [ -f `brew --prefix`/etc/autojump ]; then
#  . `brew --prefix`/etc/autojump
#fi

# コマンドの自動補完
# Cygwinだと遅いから使わない
#if [ -f ${HOME}/.zsh/auto-fu.zsh/auto-fu.zsh ]; then
#    source ${HOME}/.zsh/auto-fu.zsh/auto-fu.zsh
#    function zle-line-init () {
#        auto-fu-init
#    }
#    zle -N zle-line-init
#    zstyle ':completion:*' completer _oldlist _complete
#fi
