# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH="$HOME/.local/bin:$PATH"
export ZSH="$HOME/.oh-my-zsh"

# Set theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

# Homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"


# FZF
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS="
  --height=40%
  --layout=reverse
  --border
  --color=fg:#c0caf5,bg:#1a1b26,hl:#7aa2f7
  --color=fg+:#c0caf5,bg+:#292e42,hl+:#bb9af7
  --color=info:#7dcfff,prompt:#7aa2f7,pointer:#7aa2f7
  --color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a
  --preview 'bat --style=numbers --color=always {} || cat {}'
  --bind 'ctrl-y:execute-silent(realpath {} | pbcopy)+abort'
"

# --- Eza ---
alias ls="eza -la --icons=always"

# P10k customization
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

