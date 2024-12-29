test -s ~/.alias && . ~/.alias || true

alias cd="z"
alias grep="rg --color=auto"
alias ls="eza --color"
alias cat="bat"
alias dotslink="cd ~/.dotfiles && stow --adopt . && cd -"

export EDITOR="/usr/bin/hx"
export XBPS_DISTDIR="~/.local/pkgs/void-packages"

eval "$(starship init bash)"
eval "$(zoxide init bash)"
. "$HOME/.cargo/env"
