#!/bin/zsh

#------------------------------------------------------
# Environment variables and functions
#------------------------------------------------------
source "$CONFIG/zsh/.zshenv"
source "$CONFIG/zsh/functions.zsh"

#------------------------------------------------------
# Navigation
#------------------------------------------------------
setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

setopt LIST_PACKED          # The completion menu takes less space.
setopt AUTO_PARAM_SLASH     # Add a trailing slash to symbolic links to directories.

#------------------------------------------------------
# History
#------------------------------------------------------
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

#------------------------------------------------------
# Prompt
#------------------------------------------------------
eval "$(oh-my-posh init zsh --config $CONFIG/oh-my-posh/default.omp.json)"

#------------------------------------------------------
# Aliases
#------------------------------------------------------
source $CONFIG/zsh/aliases.zsh

#------------------------------------------------------
# Completion
#------------------------------------------------------
source $CONFIG/zsh/completion.zsh

#------------------------------------------------------
# Load specific config
#------------------------------------------------------
case `uname` in
  Darwin)
    #source $CONFIG/zsh/.zshrc-macos
  ;;
  Linux)
    #source $CONFIG/zsh/.zshrc-linux
  ;;
  FreeBSD)
    # commands for FreeBSD go here
  ;;
esac
