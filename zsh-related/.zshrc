# p10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh bootstrap
export ZSH="$HOME/.oh-my-zsh"
ZSH_CUSTOM=${ZSH_CUSTOM:-$ZSH/custom}

if [[ ! -d "$ZSH" ]]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git "$ZSH"
fi

# Powerlevel10k install
if [[ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "$ZSH_CUSTOM/themes/powerlevel10k"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

# zinit install
if [[ ! -d "$HOME/.zinit" ]]; then
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit
fi

source ~/.zinit/bin/zinit.zsh

# plugins (zinit)
zinit light zsh-users/zsh-autosuggestions
zinit light agkozak/zsh-z
zinit light zsh-users/zsh-syntax-highlighting

# Oh My Zsh core
plugins=()
source $ZSH/oh-my-zsh.sh

# tools 
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# 10k config 
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
