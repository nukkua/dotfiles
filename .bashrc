#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
alias wmqttx='nohup flatpak run com.emqx.MQTTX &> /dev/null &'


function parse_git_branch {
    local branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
    if [ ! -z "$branch" ]; then
        printf "  %s" "$branch"
    fi
}

PINK="\[\e[1;35m\]\]"  # Rosa en negrita
CYAN="\[\e[1;36m\]\]"  # Cian en negrita (sin cursiva)
RESET="\[$(tput sgr0)\]"

export PS1="${PINK} λ \u ${CYAN}\w${RESET}${CYAN}\$(parse_git_branch)${RESET} $ "
# export PS1="\[\e[0;31m\]archlinux \[\e[0;35m\]\u03BB \[\e[0m\]nukkua \u@\h \w \$ "


export PATH=$PATH:/usr/bin

export PATH=/home/leverna/.cargo/bin:$PATH


export PATH=/home/leverna/.local/bin:$PATH



export PATH="$PATH:$HOME/flutter/flutter/bin"

export PATH="$PATH:/home/leverna/.config/composer/vendor/bin"


export PATH=$PATH:~/go/bin
export PATH="$PATH:$HOME"


# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
alias sortty='python3 /usr/local/bin/sortty-bin/sortty.py'
