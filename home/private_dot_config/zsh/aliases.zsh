#!/bin/zsh

#------------------------------------------------------
# System
#------------------------------------------------------
alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias suspend='sudo pm-suspend'

alias week='date +%V'
alias resource="source \$HOME/.zshrc"
alias mkdir='mkdir -p'
alias sudo='sudo -E'

#------------------------------------------------------
# ls
#------------------------------------------------------
alias ls="ls -phlaFHAt --color=auto"

# use eza if available
if [ -x "$(command -v nvim)" ]; then
  alias ll="eza --long --header --icons --all --sort=name --group-directories-first --hyperlink --ignore-glob '.DS_Store|?'"
else
  alias ll="ls -phlaFHAt --color=auto"
fi

#------------------------------------------------------
# grep
#------------------------------------------------------
alias grep="grep -P -i --color=auto"

#------------------------------------------------------
# cp
#------------------------------------------------------
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias la='ls -alh'

#------------------------------------------------------
# git
#------------------------------------------------------
alias g="git"
alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gp='git push'
alias gpraise='git blame'
alias gpo='git push origin'
alias gpof='git push origin --force-with-lease'
alias gpofn='git push origin --force-with-lease --no-verify'
alias gpt='git push --tag'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias grb='git branch -r'                                                                           # display remote branch
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log --oneline'
alias gr='git remote'
alias grs='git remote show'
alias glol='git log --graph --abbrev-commit --oneline --decorate'
alias gclean="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d" # Delete local branch merged with master
alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"                                                             # git log for each branches
alias gsub="git submodule update --remote"                                                        # pull submodules
alias gj="git-jump"                                                                               # Open in vim quickfix list files of interest (git diff, merged...)

alias dif="git diff --no-index"                                                                   # Diff two files even if not in git repo! Can add -w (don't diff whitespaces)

eval "$(gh copilot alias -- zsh)"

# use lazygit if available
if [ -x "$(command -v lazygit)" ]; then
  alias laz="lazygit"
  alias lg="lazygit"
  alias lz="lazygit"
fi

#------------------------------------------------------
# tmux
#------------------------------------------------------
alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

#------------------------------------------------------
# neovim
#------------------------------------------------------
# use nvim if available
if [ -x "$(command -v nvim)" ]; then
  alias v="nvim"
  alias vi="nvim"
  alias vim="nvim"
fi

#------------------------------------------------------
# docker
#------------------------------------------------------
# use lazydocker if available
if [ -x "$(command -v lazydocker)" ]; then
  alias ld="lazydocker"
fi
