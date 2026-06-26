# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR=nvim

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
else
    echo "bash-completion missing woi"
fi

if command -v fzf >/dev/null 2>&1; then
    eval "$(fzf --bash)"

    if command -v fd >/dev/null 2>&1; then
        export FZF_CTRL_T_COMMAND='fd --type f'
        export FZF_ALT_C_COMMAND='fd --type d'
    else
        echo "fd belum terinstall, Ctrl+T dan Alt+C pakai backend bawaan fzf"
    fi
else
    echo "fzf belum terinstall"
fi

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init bash)"
else
    echo "zoxide belum terinstall"
fi

