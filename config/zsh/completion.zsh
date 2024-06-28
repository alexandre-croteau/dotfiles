# https://github.com/Phantas0s/.dotfiles/blob/master/zsh/completion.zsh
  # ____ ___  __  __ ____  _     _____ _____ ___ ___  _   _
#  / ___/ _ \|  \/  |  _ \| |   | ____|_   _|_ _/ _ \| \ | |
# | |  | | | | |\/| | |_) | |   |  _|   | |  | | | | |  \| |
# | |__| |_| | |  | |  __/| |___| |___  | |  | | |_| | |\  |
#  \____\___/|_|  |_|_|   |_____|_____| |_| |___\___/|_| \_|
 #

autoload -U compinit; compinit
_comp_options+=(globdots)

# fzf 🌸 A command-line fuzzy finder
eval "$(fzf --zsh)"

# Homebrew 🍺 The missing package manager for macOS (or Linux)
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  # Google Cloud SDK
  source "$(brew --prefix)/share/google-cloud-sdk/path.zsh.inc"
  source "$(brew --prefix)/share/google-cloud-sdk/completion.zsh.inc"

  # zsh-autosuggestions 🌟 Fish-like autosuggestions for zsh
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=220,bold"
  ZSH_AUTOSUGGEST_STRATEGY=(history completion)

  HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
  if [ -f "$HB_CNF_HANDLER" ]; then
  source "$HB_CNF_HANDLER";
  fi

  export HOMEBREW_BUNDLE_FILE_GLOBAL="$CONFIG/homebrew/Brewfile"
fi

#------------------------------------------------------
# zstyles
#------------------------------------------------------

# zstyle pattern
# :completion:<function>:<completer>:<command>:<argument>:<tag>

# Completer
zstyle ':completion:*' completer _extensions _complete _approximate

# Use cache for commands using cache
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/.zcompcache"

# The Completion Menu
zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true

zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'
zstyle ':completion:*:*:*:*:descriptions' format '%F{blue}-- %D %d --%f'
zstyle ':completion:*:*:*:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:*:*:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:*:*:*:default' list-colors ${(s.:.)LS_COLORS}

# Grouping Results
zstyle ':completion:*' file-sort modification follow
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories

# Required for completion to be in good groups (named after the tags)
zstyle ':completion:*' group-name ''

zstyle ':completion:*:*:-command-:*:*' group-order alias builtins functions commands

# fzf-tab
source "$CONFIG/fzf/fzf-tab/fzf-tab.plugin.zsh"

