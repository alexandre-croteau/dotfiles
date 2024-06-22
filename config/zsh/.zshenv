export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR="nvim"

export CURL_HOME="$CONFIG/curl"

export ZSH_COMPDUMP="$CACHE/.zcompdump"
export ZCOMPDUMP="$CACHE/.zcompdump"

export ZDOTDIR="$CONFIG/zsh"
export USER_ZDOTDIR="$ZDOTDIR"

export XDG_CONFIG_HOME="$CONFIG"
export XDG_CACHE_HOME="$CACHE"

export NVIM_APPNAME="lazyvim"

export HISTFILE=$CACHE/.zsh_history
export HIST_STAMPS="yyyy.mm.dd"

export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
export PATH="$PATH:$HOME/.local/bin" # This add pipx env
export PATH="$PATH:$HOME/.dotnet/tools" # Add .NET Core SDK tools

export NVM_DIR="$HOME/.nvm"
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export DOTNET_ROOT="/opt/homebrew/opt/dotnet/libexec"

export FZF_DEFAULT_OPTS_FILE="$CONFIG/fzf/fzfrc"