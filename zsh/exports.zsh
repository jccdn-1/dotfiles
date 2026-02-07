export PATH="$HOME/.local/bin:$PATH"

if [[ -d "/Applications/Postgres.app/Contents/Versions/latest/bin" ]]; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

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
