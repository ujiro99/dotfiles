# Source global definitions
if [ -f /etc/bashrc ]; then
    ./etc/bashrc
fi

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
HISTCONTROL=ignoredups

#set history=200
#set savehistory=200
set -o ignoreeof
unset autologout

export SHELL=/bin/bash
export TMPDIR=/tmp
export TZ=JST-09
export MAKE_MODE=unix

# lsコマンドの色設定
# LS_COLORS='no=00:fi=00:di=01;35:ln=01;36:pi=40;33:so=01;36:do=01;36:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:';
# export LS_COLORS

## 環境変数
# 日本語文字コードの指定
#export LANG=ja_JP.Shift_JIS
#export OUTPUT_CHARSET=sjis
## タイムゾーンの指定
export TZ=JST-9
## デフォルトのページャをlessにする
export PAGER=less
## lessのステータス行にファイル名と行数、％を表示する
export LESS='-X -r -i -P ?f%f:(stdin). ?lb%lb?L/%L.. [?eEOF:?pb%pb\%..]'
## lessの文字コードを指定する
#export JLESSCHARSET=japanese-sjis
## DISPLAY変数を指定する
#if [ -n ${DISPLAY} ]; then
#  export DISPLAY=localhost:0.0
#fi
## TERM変数を指定する
#if [ ! -n "${TERM}" ]; then
#  export TERM=cygwin
#fi
#
#PATH=/usr/local/sbin:/usr/sbin:/sbin:.:~/bin
#PATH=/usr/local/bin:/usr/X11R6/bin:/usr/bin:/bin:$PATH
#JLESSCHARSET=japanese-sjis
#export PATH PAGER JLESSCHARSET


## Alias 一覧
# ls の8ビット透過にする
alias ls='ls --color=auto'
alias l="ls -a --color=auto"
alias ll="ls -l"
# updatedbでwindows領域を除外する
alias updatedb='updatedb --localpaths="/bin /dev /etc /home /lib /sbin /srv /usr /var" --prunepaths="/usr/tmp /var/tmp"'
alias j=jobs
alias vi=vim
alias c=cd
alias u="cd ../"
alias uu="cd ../../"
alias uuu="cd ../../../"
alias g="git"

if [ -d cygpath ]; then
    SYSTEM=`cygpath -u ${SYSTEMROOT}`/system32
    alias ping="$SYSTEM/ping.exe"
    alias arp="$SYSTEM/arp.exe"
    alias nslookup="$SYSTEM/nslookup.exe"
    alias traceroute="$SYSTEM/tracert.exe"
    alias route="$SYSTEM/route.exe"
    alias netstat="$SYSTEM/netstat.exe"
    alias ipconfig="$SYSTEM/ipconfig.exe"
    alias ifconfig=ipconfig
    alias st="cygstart"
    alias a="adb"
    alias ad="adb devices"
    alias fk="taskkill /f /im"
    unset SYSTEM
fi
