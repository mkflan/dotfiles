export EDITOR="/usr/bin/hx"
export DOTFILES_DIR="$HOME/dotfiles"
export PATH="$PATH:$HOME/.local/bin"

[ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ] && exec startx
