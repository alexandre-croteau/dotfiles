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
  alias ll="eza --long --header --icons --all --sort=name --group-directories-first --hyperlink --ignore-glob '.DS_Store|?'"
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
  alias lg="lazygit"
  alias lz="lazygit"
fi

# use lazygit if available
if [ -x "$(command -v lazydocker)" ]; then
  alias ld="lazydocker"
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
# Homebrew 🍺 The missing package manager for macOS (or Linux)
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  setopt LIST_PACKED
  setopt AUTO_PARAM_SLASH

  zstyle ':completion:*' use-cache on
  zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

  # zstyle ':completion:*' completer _extensions _complete _approximate
  zstyle ':completion:*' menu select # interactive search
  zstyle ':completion:*' file-sort modification follow
  zstyle ':completion:*' squeeze-slashes true
  # zstyle ':completion:*' complete-options true
  zstyle ':completion:*' group-name ''
  zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands
  # zstyle ':completion:*' file-list all
  # zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  # zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

  zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
  zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
  zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
  zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

  _comp_options+=(globdots)
  autoload -U compinit
  compinit
fi

# fzf 🌸 A command-line fuzzy finder
eval "$(fzf --zsh)"

# Pipx
# if type pipx &>/dev/null
# then
#   autoload -U bashcompinit
#   bashcompinit

#   eval "$(register-python-argcomplete pipx)"
# fi

# Google Cloud SDK
source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"
