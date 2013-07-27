## Command history configuration
if [ -z $HISTFILE ]; then
    HISTFILE=$HOME/.zsh_history
fi
HISTSIZE=2000
SAVEHIST=10000000

setopt append_history
setopt extended_history
setopt histfindnoups
setopt hist_ignore_space
setopt histreduceblanks
setopt hist_verify
setopt inc_append_history
setopt share_history # share command history data
