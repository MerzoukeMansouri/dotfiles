fzf-k9s-bookmark() {
  local ns
  ns=$(sort -u "$HOME/.k9s_bookmarks" 2>/dev/null | fzf --height 40% --layout=reverse --border --prompt="k9s ns> ")
  if [[ -n "$ns" ]]; then
    BUFFER="k9s -n ${(q)ns}"
    zle accept-line
  fi
  zle reset-prompt
}
zle -N fzf-k9s-bookmark
bindkey '^K' fzf-k9s-bookmark

fzf-recent-directory() {
  local dir=$(zoxide query -l | fzf --height 40% --layout=reverse --border --prompt="Recent > ")
  [[ -n "$dir" ]] && { BUFFER="cd ${(q)dir}"; zle accept-line }
  zle reset-prompt
}
zle -N fzf-recent-directory
bindkey '^F' fzf-recent-directory
