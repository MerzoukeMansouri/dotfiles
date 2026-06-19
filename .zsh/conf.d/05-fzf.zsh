export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info \
  --bind 'ctrl-/:toggle-preview' --bind 'ctrl-y:execute-silent(echo {} | pbcopy)' \
  --color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

(( $+commands[fd] )) && {
  export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
}

[[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ]] && \
  source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
