#
# PATH setting
#

# Heroku
PATH=/usr/local/heroku/bin:${PATH}
# android sdk
PATH=/Users/uj/Library/Android/sdk/platform-tools:${PATH}
# nodebrew
PATH=${HOME}/.nodebrew/current/bin:${PATH}
# pyenv
PATH=${HOME}/.pyenv/shims:${PATH}
# cabal
PATH=${HOME}/.cabal/bin:${PATH}
# go
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=${HOME}/go/thirdparty:${HOME}/go/work
PATH=${HOME}/go/thirdparty/bin:${HOME}/go/work/bin:${GOROOT}/bin:${PATH}
