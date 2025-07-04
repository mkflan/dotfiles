ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit if it isn't there yet
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "${ZINIT_HOME}/zinit.zsh"

# zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Completions
autoload -U compinit && compinit
zinit cdreplay -q
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# History
HISTSIZE=5000
HISTFILE="$HOME/.zsh_history"
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Keybindings
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# export EDITOR="/usr/bin/hx"
# export DOTFILES_DIR="$HOME/dotfiles"
# export PATH="~/.local/bin:$PATH"

# Aliases
alias grep="rg --color=auto"
alias ls="eza --color"
alias cat="bat"
alias dl="$DOTFILES_DIR/scripts/dotslink"
alias cdwm="cd $HOME/dwm; sudo make clean install; cd -"
alias cdwmb="cd $HOME//dwmblocks; sudo make clean install; cd -"

# Over-the-Wire Games
function bandit() {
	ssh -p 2220 bandit"$1"@bandit.labs.overthewire.org
}

eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"
eval "$(fzf --zsh)"
. "$HOME/.cargo/env"
