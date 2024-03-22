#!/bin/zsh

#------------------------------------------------------
# Environment variables and functions
#------------------------------------------------------
source "$CONFIG/zsh/.zshenv"
source "$CONFIG/zsh/functions.zsh"

export plugins=(
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

#------------------------------------------------------
# Aliases
#------------------------------------------------------
alias week='date +%V'
alias resource="source \$HOME/.zshrc"
alias mkdir='mkdir -p'
alias sudo='sudo -E'
alias ls="ls -phlaFHAt --color=auto"
alias g="git"

# GH Copilot
eval "$(gh copilot alias -- zsh)"

# use eza if available
if [ -x "$(command -v nvim)" ]; then
  alias ll="eza --long --header --icons --all --sort=name --hyperlink --ignore-glob '.DS_Store|?'"
else
  alias ll="ls -phlaFHAt --color=auto"
fi

# use nvim if available
if [ -x "$(command -v nvim)" ]; then
  alias v="nvim"
  alias vi="nvim"
  alias vim="nvim"
fi

# use lazygit if available
if [ -x "$(command -v lazygit)" ]; then
  alias laz="lazygit"
  alias lazy="lazygit"
fi

#------------------------------------------------------
# Load specific config
#------------------------------------------------------
case `uname` in
  Darwin)
    source $CONFIG/zsh/.zshrc-macos
  ;;
  Linux)
    source $CONFIG/zsh/.zshrc-linux
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac

# Oh-my-posh
eval "$(oh-my-posh init zsh --config $CONFIG/oh-my-posh/default.omp.json)"

#------------------------------------------------------
# Completions
#------------------------------------------------------
# Homebrew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  _comp_options+=(globdots)
  autoload -U compinit
  compinit
fi

# Pipx
# if type pipx &>/dev/null
# then
#   autoload -U bashcompinit
#   bashcompinit

#   eval "$(register-python-argcomplete pipx)"
# fi
