export AWS_DEFAULT_REGION=ca-central-1

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export CURL_HOME=$CONFIG/curl

export ZSH_COMPDUMP="$CACHE/.zcompdump"
export ZCOMPDUMP="$CACHE/.zcompdump"

export ZDOTDIR="$CONFIG/zsh"
export USER_ZDOTDIR="$ZDOTDIR"

export HISTFILE=$CACHE/.zsh_history
export HIST_STAMPS="yyyy.mm.dd"

export EDITOR="nvim"

# export NODE_REPL_HISTORY=""
# export NODE_REPL_MODE="sloppy"

# export HOMEBREW_NO_ENV_HINTS=1
# export HISTCONTROL="ignoreboth" # Omit duplicates and commands that begin with a space from history.
# export LANG="en_US.UTF-8"

# export GPG_TTY=$(tty)

# export GOPATH=$LIB/.go
# export GOMODCACHE=$CACHE/go-mod
# export GOCACHE=$CACHE/go

# export NPM_CONFIG_USERCONFIG=$CONFIG/.npmrc

# export YARN_CACHE_FOLDER=$CACHE/yarn
# export YARN_GLOBAL_FOLDER=$BIN/yarn
# export YARN_ENABLE_GLOBAL_CACHE=true

# export LESSHISTFILE=$CACHE/.lesshst

# export DOCKER_CONFIG="$LIB/docker"
# export DENO_INSTALL="$LIB/deno"

# export PATH="$BIN:$PATH"

alias g="git"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
# alias nv="neovide"
# alias cat="bat"
# alias ccat="/bin/cat"
alias resource="source \$HOME/.zshrc"
alias ls="ls -phFHAtG --color=auto"
alias ll="eza --long --header --icons --all"
alias mkdir='mkdir -p'
# alias rg='ranger'
# alias sudo='sudo -E'

export dev="$DEVELOPMENT"
