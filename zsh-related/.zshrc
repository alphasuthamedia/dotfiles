# p10k instant prompt (keep at top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=()

# zinit
if [[ ! -d "$HOME/.zinit" ]]; then
  git clone https://github.com/zdharma-continuum/zinit.git ~/.zinit
fi
source ~/.zinit/zinit.zsh

zinit light zsh-users/zsh-autosuggestions
zinit light agkozak/zsh-z
zinit light zsh-users/zsh-syntax-highlighting

source $ZSH/oh-my-zsh.sh

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
