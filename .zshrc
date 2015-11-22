
# load settings.
source ~/dotfiles/.zshrc.peco
source ~/dotfiles/.zshrc.tmux

# nvm
# [ -f ${HOME}/.nvm/nvm.sh ] && source ${HOME}/.nvm/nvm.sh
# rbenv
# if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# source /usr/local/Cellar/rbenv/0.4.0/completions/rbenv.zsh

## PATH setting
PATH=${HOME}/bin:/usr/local/bin:${PATH}
PATH="/usr/local/heroku/bin:${PATH}"                            # Heroku
PATH="/Users/uj/Library/Android/sdk/platform-tools:${PATH}"     # android sdk
PATH=$HOME/.nodebrew/current/bin:$PATH                          # nodebrew
PATH=$HOME/.pyenv/shims:$PATH                                   # pyenv
PATH=$HOME/.cabal/bin:$PATH                                     # cabal
# go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
PATH=$GOPATH/bin:$GOROOT/bin:$PATH

## Keybind configuration
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


## Alias configuration
# expand aliases before completing
setopt complete_aliases     # aliased ls needs if file/dir completions work

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    alias ll="ls -lh"
    alias vi="/Applications/MacVim.app/Contents/MacOS/Vim"
    alias gvim="/Applications/MacVim.app/Contents/MacOS/mvim"
    ;;
cygwin*)
    alias ls="ls --color"
    alias cdd="cd ~/Desktop/"
    alias cd/="cd /cygdrive/c/"
    alias fk="taskkill /f /im"
    alias tcpdump="windump"
    alias apt="apt-cyg -m ftp://ftp.iij.ad.jp/pub/cygwin/"
    alias st="cygstart"
    alias gtags="gtags -v --gtagsconf /glo622wb/share/gtags/gtags.conf"
    alias htags="htags -sanovwF"
esac

alias where="command -v"
alias c="cd"
alias e="vi"
alias l="ls -a"
alias la="ls -a"
alias ll="ls -la"
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias sc="screen"
alias pw="pwd"
alias g="git"
alias gst="git st -s -b && git stash list"
alias grep="grep -i"
alias u="../"
alias uu="../../"
alias uuu="../../../"
alias :q="exit"
alias a="adb"
alias ad="adb devices"
alias as="adb shell"
alias al="adb logcat -v time"

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
# GREP_OPTIONS="--color=auto $GREP_OPTIONS"

# z
. `brew --prefix`/etc/profile.d/z.sh
