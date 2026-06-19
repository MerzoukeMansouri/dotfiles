# fnm - eager init for IDE compatibility
(( $+commands[fnm] )) && eval "$(fnm env --use-on-cd --shell zsh 2>/dev/null)"

# Angular CLI - lazy load
ng() {
  unfunction ng 2>/dev/null
  source <(command ng completion script 2>/dev/null) || true
  command ng "$@"
}
