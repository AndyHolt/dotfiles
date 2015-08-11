## Global config file for zsh.
## Load global settings, and call loading of system specific settings too.

# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="adh"

# load aliases from another file
if [[ -r ~/.zsh_aliases ]]; then
   . ~/.zsh_aliases
fi

# Check for updates every 3 days
export UPDATE_ZSH_DAYS=3

# find system type (Linux, OSX, Windows etc)
if [[ `uname` == 'Linux' ]]; then
    export LINUX=1
else
    export LINUX=0
fi

if [[ `uname` == 'Darwin' ]]; then
    export OSX=1
else
    export OSX=0
fi

# Load plugins according to OS. Different settings for Linux and OSX.
if [[ $LINUX -eq 1 ]]; then
    plugins=(autojump command-not-found gem git git-annex pip ruby rvm tmux
             tmuxinator)    
fi
if [[ $OSX -eq 1 ]]; then
    plugins=(autojump brew bundler gem gibo git osx pip python ruby rvm tmux
             tmuxinator vagrant)
fi

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Use emacs keybindings for zle (Z-Shell Line Editor)
bindkey -e

# don't kill running processes when exiting shell
setopt nohup

# use emacs, connect to server
export EDITOR='emacsclient -c -a=""'

# some linux specific setup
if [[ $LINUX -eq 1 ]]; then
    # tmux powerline set up stuff
    export PATH="$HOME/.local/bin:$PATH"

    # Add RVM to PATH for scripting
    export PATH="$PATH:$HOME/.rvm/bin"
    # Load RVM into a shell session *as a function*
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

    # add cask binary to path
    export PATH="$HOME/.cask/bin:$PATH"
fi

# autostart tmux when starting zsh
# [fix] - zsh doesn't autoconnect to tmux. Why?
# handled by terminal apps instead for now
# ZSH_TMUX_AUTOSTART="false"
# ZSH_TMUX_AUTOCONNECT="true"

# zmv for batch file renaming
autoload zmv

# [todo] - take machine specific settings out to specific script
# set some directory names to parameters for shortening in prompt

# set ipython directory for config files etc
export IPYTHONDIR="$HOME/dotfiles/ipython"

# set python path to find modules in PythonTools directory
export PYTHONPATH="$PYTHONPATH:$HOME/Projects/PythonTools"
# also add Walter source directory
export PYTHONPATH="$PYTHONPATH:$HOME/Projects/Walter/src"

# ensure VIRTUALENV pythons use python3
export VIRTUALENV_PYTHON="/usr/bin/python3"

# don't let VIRTUALENV modify my prompt. I'll do that myself thanks.
export VIRTUAL_ENV_DISABLE_PROMPT="TRUE"

# change vagrant home directory
# export VAGRANT_HOME="$HOME/data/VMs/vagrant.d"

# change MySQL prompt to something much more useful
export MYSQL_PS1="\u at \h using \d\n> "

# set max width of man pages to 80 characters.
export MANWIDTH=80

# add projects directory to PATH
if [[ -d $HOME/Projects/WritingTools ]]; then
    export PATH="$PATH:$HOME/Projects/WritingTools"
fi

if [[ -d $HOME/Projects/gibo ]]; then
    export PATH="$PATH:$HOME/Projects/gibo"
fi
