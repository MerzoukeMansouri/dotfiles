mcd() { mkdir -p "$1" && cd "$1" }

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
  vault login -method=oidc -namespace="$ns" -address="$addr" && \
  [[ -f ~/.vault-token ]] && pbcopy < ~/.vault-token && \
  echo "VAULT_TOKEN=$(<~/.vault-token)" > ~/.env-spring && \
  open "https://vault.m14i.com/config?token=$(cat ~/.vault-token)&url=$addr&namespace=$ns"
}

nvault-me() {
  local ns="${1:-adeo/solution-offer-design}"
  vault login -method=oidc -namespace="$ns" -address="https://vault-nprd.factory.adeo.cloud" && \
  [[ -f ~/.vault-token ]] && pbcopy < ~/.vault-token && \
  echo "VAULT_TOKEN=$(<~/.vault-token)" > ~/.env-spring && \
  echo "✓ Logged in to namespace: $ns"
}
