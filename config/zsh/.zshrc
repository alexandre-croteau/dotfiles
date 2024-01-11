#!/bin/zsh

source "$CONFIG/zsh/.zshenv"
source "$CONFIG/zsh/functions.zsh"

WHO=$(whoami)

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

#[ -r "$HOME/env.zsh" ] && source "$HOME/env.zsh"

#setopt interactivecomments
#setopt HIST_SAVE_NO_DUPS

#bindkey "^X^_" redo
#bindkey -v

#command -v direnv &>/dev/null && eval "$(direnv hook zsh)"

export plugins=(
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  _comp_options+=(globdots)
  autoload -U compinit
  compinit

fi

eval "$(oh-my-posh init zsh --config $CONFIG/oh-my-posh/default.omp.json)"
