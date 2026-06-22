mcd() { mkdir "$@" && cd "${@[-1]}" }

k9sb() {
  local ns
  ns=$(sort -u "$HOME/.k9s_bookmarks" 2>/dev/null | fzf --prompt="Namespace> " --height=40% --reverse)
  [[ -n "$ns" ]] && k9s -n "$ns"
}

k9sba() {
  local ns="${1:-$(kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)}"
  [[ -z "$ns" ]] && echo "Usage: k9sba [namespace]" && return 1
  grep -qxF "$ns" "$HOME/.k9s_bookmarks" 2>/dev/null \
    && echo "'$ns' already bookmarked" \
    || { echo "$ns" >> "$HOME/.k9s_bookmarks"; echo "Bookmarked '$ns'" }
}

tms() { [[ -z "$1" ]] && echo "Usage: tms <session-name>" && return 1; tmux new-session -A -s "$1" }

jqless() { jq -C . "$@" | less -R }

code-spring() {
  local project_path="${1:-.}"
  code \
    --user-data-dir "$HOME/.vscode-profiles/spring/data" \
    --extensions-dir "$HOME/.vscode-profiles/spring/extensions" \
    "$project_path"
}

vault-me() {
  local ns="${1:-adeo/service-master-data}"
  local addr="https://vault.factory.adeo.cloud/"

  if ! vault token lookup -address="$addr" -namespace="$ns" > /dev/null 2>&1; then
    vault login -method=oidc -namespace="$ns" -address="$addr" skip_browser=true || return 1
  fi

  [[ -f ~/.vault-token ]] && pbcopy < ~/.vault-token
  echo "VAULT_TOKEN=$(<~/.vault-token)" > ~/.env-spring
  open "https://vault.m14i.com/config?token=$(cat ~/.vault-token)&url=$addr&namespace=$ns"
}

nvault-me() {
  local ns="${1:-adeo/solution-offer-design}"
  local addr="https://vault-nprd.factory.adeo.cloud"

  if ! vault token lookup -address="$addr" -namespace="$ns" > /dev/null 2>&1; then
    vault login -method=oidc -namespace="$ns" -address="$addr" skip_browser=true || return 1
  fi

  [[ -f ~/.vault-token ]] && pbcopy < ~/.vault-token
  echo "VAULT_TOKEN=$(<~/.vault-token)" > ~/.env-spring
  echo "✓ Logged in to namespace: $ns"
}
