(( $+commands[eza] )) && {
  alias ls='eza --icons --git'
  alias ll='eza -l --icons --git --header'
  alias la='eza -la --icons --git --header'
  alias lt='eza --tree --level=2 --icons --git'
  alias l='eza -lah --icons --git --header --group-directories-first'
}
(( $+commands[http] )) && alias https='http --default-scheme=https'
(( $+commands[btop] )) && alias top='btop'

alias jqc='pbpaste | jq .'
alias cpwd='pwd | pbcopy'
alias clast='fc -ln -1 | pbcopy'
alias tm='tmux' tma='tmux attach -t' tmn='tmux new -s' tml='tmux ls' tmk='tmux kill-session -t'
alias v='nvim' vim='nvim' vi='nvim'
alias lg='lazygit'
alias ghw='gh repo view --web'
alias idea='open -a "/Applications/IntelliJ IDEA.app"'
alias clode='ollama launch claude'
alias ssh-vps='ssh -i ~/.ssh/my_key root@my-vps.example.com'
alias ssh-host-a='ssh user@host-a'
alias ssh-host-b='ssh host-b'
alias git-clean="git branch | grep -vE '^\*|main|develop' | xargs -n 1 git branch -D"
alias oc='opencode run "use caveman ultra mode"'

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
