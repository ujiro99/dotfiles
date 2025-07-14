#
# ghq-fzf.zsh mod for warp
#
# ABOUT:
#   `cd` to `ghq` repositories directory on `zsh`
#   You can launch this function with `Ctrl-g`
#
# INSTALLATION:
#   Requires `zsh` and `fzf`
#   Download this file then, append `source path/to/fzf-ghq.zsh` to your `~/.zshrc`
#   or copy & paste to your `~/.zshrc`
# 

function _fzf_cd_ghq() {
    FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --reverse --height=50%"
    local root="$(ghq root)"
    local repo="$(ghq list | fzf --preview="ls -AF --color=always ${root}/{1}")"
    local dir="${root}/${repo}"
    [ -n "${dir}" ] && cd "${dir}"
}

zle -N _fzf_cd_ghq
bindkey "^g" _fzf_cd_ghq
