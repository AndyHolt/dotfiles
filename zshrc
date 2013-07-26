# The following lines were added by compinstall

zstyle ':completion:*' completer _list _expand _complete _ignored _match _correct _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' glob 1
zstyle ':completion:*' matcher-list ''
zstyle ':completion:*' max-errors 3 numeric
zstyle ':completion:*' substitute 1
zstyle :compinstall filename '/home/adh/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# use emacs style key bindings
bindkey -e

# SETUP HISTORY OPTIONS - need to update these to ensure history is never lost.
HISTFILE=~/.zsh_history
HISTSIZE=2000
SAVEHIST=10000

# share history between zsh sessions and save time info for each command
setopt sharehistory extendedhistory

# don't display duplicate lines in UP history, but do store them.
# Cleanup whitespace in lines before saving
setopt histfindnodups histreduceblanks

# when using bang substitutions etc, print the new line before executing it
# (allows easy checking that we're not going to do something stupid)
setopt histverify

# change directory when 'cd' is ommitted.
setopt autocd

# GLOB AND MATCHING OPTIONS
setopt extendedglob nomatch badpattern


# don't hang up (exit) background jobs when exiting shell
setopt nohup

# wait until I'm finished before notifying of background job completion
setopt nonotify

# don't bleep at me
unsetopt beep
