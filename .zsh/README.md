# dotfiles

My personal dotfiles managed with a bare git repo — no symlinks, no extra tools.

## Setup on a new machine

```sh
# Clone the bare repo
git clone --bare git@github.com:MerzoukeMansouri/dotfiles.git ~/.dotfiles

# Define the alias for this session
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Checkout the files
dotfiles checkout

# Hide untracked files from dotfiles status
dotfiles config --local status.showUntrackedFiles no
```

> If `dotfiles checkout` fails because existing files conflict (e.g. a default `~/.zshrc`),
> back them up first: `mkdir -p ~/.dotfiles-backup && dotfiles checkout 2>&1 | grep '^\s' | xargs -I{} mv ~/{} ~/.dotfiles-backup/{}`

Then copy and fill in your secrets:

```sh
cp ~/.zshrc.local.example ~/.zshrc.local
# edit ~/.zshrc.local and add your tokens/API keys
```

## Structure

```
~/.zshrc                    # entry point — sources conf.d/* then ~/.zshrc.local
~/.zshrc.local.example      # secrets template (committed)
~/.zshrc.local              # real secrets (gitignored, never committed)
~/.zsh/conf.d/
  00-path.zsh               # PATH
  01-omz.zsh                # Oh My Zsh + Powerlevel10k
  02-env.zsh                # EDITOR, DOCKER_HOST
  03-history.zsh            # history settings
  04-completion.zsh         # compinit
  05-fzf.zsh                # FZF config + key-bindings
  06-zoxide.zsh             # zoxide (cd replacement)
  07-tools.zsh              # fnm, Angular CLI
  08-aliases.zsh            # all aliases
  09-functions.zsh          # mcd, tms, vault-me, code-spring…
  10-keybindings.zsh        # Ctrl+F directory picker
  11-conda.zsh              # conda init
```

## Daily usage

The `dotfiles` alias wraps git against the bare repo:

```sh
dotfiles status
dotfiles add ~/.zsh/conf.d/08-aliases.zsh
dotfiles commit -m "feat: add alias"
dotfiles push
```

## Dependencies

| Tool | Purpose |
|------|---------|
| [Oh My Zsh](https://ohmyz.sh) | zsh framework |
| [Powerlevel10k](https://github.com/romkatv/powerlevel10k) | prompt theme |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | smarter `cd` |
| [fzf](https://github.com/junegunn/fzf) | fuzzy finder |
| [fd](https://github.com/sharkdp/fd) | faster `find` (optional, enhances fzf) |
| [eza](https://github.com/eza-community/eza) | modern `ls` (optional) |
| [fnm](https://github.com/Schniz/fnm) | Node version manager |
| [neovim](https://neovim.io) | editor |
| [lazygit](https://github.com/jesseduffield/lazygit) | git TUI |
| [btop](https://github.com/aristocratos/btop) | system monitor (optional) |
| [OrbStack](https://orbstack.dev) | Docker runtime (macOS) |
