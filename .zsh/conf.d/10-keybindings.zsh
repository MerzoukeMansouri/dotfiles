fzf-recent-directory() {
  local dir=$(zoxide query -l | fzf --height 40% --layout=reverse --border --prompt="Recent > ")
  [[ -n "$dir" ]] && { BUFFER="cd ${(q)dir}"; zle accept-line }
  zle reset-prompt
}
zle -N fzf-recent-directory
bindkey '^F' fzf-recent-directory
