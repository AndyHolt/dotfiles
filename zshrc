## Global config file for zsh.
## Load global settings, and call loading of system specific settings too.

# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="adh"

# Add run-emacs to path (before setting up aliases)
if [[ -d $HOME/Projects/run-emacs ]]; then
    export PATH="$PATH:$HOME/Projects/run-emacs"
fi

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
    export MACOS=1
else
    export MACOS=0
fi

# settings for zsh-background-notify
# notification threshold in seconds
export bgnotify_threshold=5
# notification function
function bgnotify_formatted {
  ## $1=exit_status, $2=command, $3=elapsed_time
    [ $1 -eq 0 ] && title="Command complete" || title="Houston, we have a problem"
    bgnotify "$title" "$2 ran in $3 s";
}

# Load plugins according to OS. Different settings for Linux and OSX.
if [[ $LINUX -eq 1 ]]; then
    plugins=(autojump command-not-found gem git git-annex pip ruby rvm tmux
             tmuxinator)    
fi
if [[ $MACOS -eq 1 ]]; then
    plugins=(
        autojump
        bgnotify
        brew
        bundler
        cask
        colored-man-pages
        gem
        gibo
        git
        macos
        pip
        python
        ripgrep
        ruby
        rvm
        tmux
        tmuxinator
        vagrant
    )
fi

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# Use emacs keybindings for zle (Z-Shell Line Editor)
bindkey -e

# don't kill running processes when exiting shell
setopt nohup

# use emacs, connect to server
if [[ -d $HOME/Projects/run-emacs ]]; then
    export EDITOR='run-emacs -w'
else
    export EDITOR='emacsclient -c -a=""'
fi

# use pandoc completion if available
autoload bashcompinit
bashcompinit
if [[ -d $HOME/Projects/pandoc-completion ]]; then
    source ~/Projects/pandoc-completion/pandoc-completion.bash
fi  

# some linux specific setup
if [[ $LINUX -eq 1 ]]; then
    # tmux powerline set up stuff
    export PATH="$HOME/.local/bin:$PATH"

    # add cask binary to path
    export PATH="$HOME/.cask/bin:$PATH"
fi

# Add RVM to PATH
export PATH="$PATH:$HOME/.rvm/bin"
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

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
    # WritingTools -- tools for writing things.
    export PATH="$PATH:$HOME/Projects/WritingTools"
    export FPATH="$FPATH:$HOME/Projects/WritingTools"
fi
if [[ -d $HOME/Projects/gibo ]]; then
   # gibo -- generates .gitignore files 
   export PATH="$PATH:$HOME/Projects/gibo"
fi
if [[ -d $HOME/Projects/formd ]]; then
    # formd -- a markdown formatting tool
    export PATH="$PATH:$HOME/Projects/formd"
fi
if [[ -d $HOME/Projects/Tools ]]; then
    # tools -- general scripts, helps and tools
    export PATH="$PATH:$HOME/Projects/Tools"
fi
if [[ -d $HOME/Projects/Erasmus ]]; then
    # Erasmus -- bible text tools
    export PATH="$PATH:$HOME/Projects/Erasmus"
fi
if [[ -d $HOME/Projects/Zenodotus ]]; then
    # Zonodotus -- Resource tools
    export PATH="$PATH:$HOME/Projects/Zenodotus"
fi
if [[ -d $HOME/Projects/mailsync ]]; then
    # mailsync - fetch and index mail
    export PATH="$PATH:$HOME/Projects/mailsync"
    export FPATH="$FPATH:$HOME/Projects/mailsync"
fi
if [[ -d $HOME/Projects/calsync ]]; then
    # calsync - fetch calendar data for org files
    export PATH="$PATH:$HOME/Projects/calsync"
    export FPATH="$FPATH:$HOME/Projects/calsync"
fi

# set maildir directory
export MAILDIR="$HOME/.mail"

# pkgconfig setup required for emacs pdf-tools package
export PKG_CONFIG_PATH=/usr/local/Cellar/pkg-config/0.29.2/bin/pkg-config
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/Cellar/zlib/1.2.8/lib/pkgconfig:/usr/local/lib/pkgconfig:/opt/X11/lib/pkgconfig"
export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/usr/local/Cellar/libffi/3.2.1/lib/pkgconfig/"

# set colours for ls command
# See ls man page under LSCOLORS for settings details
export LSCOLORS="gxfxcxdxbxegedabagacad"

# enable zsh expansion for cask, the emacs package manager
export FPATH="$HOME/dotfiles/:$HOME/dotfiles/zsh-completion/:$FPATH"
autoload -U compinit && compinit

# Add TeXLive installation to PATH
# export PATH="/usr/local/texlive/2020/bin/x86_64-darwin:$PATH"

export PATH="$PATH:$HOME/Projects/watson-ruby/bin/"

# source ~/dotfiles/zsh-autosuggestions/zsh-autosuggestions.zsh
# export ZSH_AUTOSUGGEST_STRATEGY=(completion history)

# add latex package and class directory to path
if [[ -d $HOME/Projects/LaTeXClasses ]]; then
    export PATH="$PATH:$HOME/Projects/LaTeXClasses"
    export FPATH="$FPATH:$HOME/Projects/LaTeXClasses"
fi

# Function to open a man page in Preview as a pdf
function manpdf {
    # $1 is man page to view
    man -t $1 | open -fa Preview
}

# Set up for pyenv, managing python versions
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Google cloud SDK set up
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/adh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/adh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/adh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/adh/google-cloud-sdk/completion.zsh.inc'; fi

export CLOUDSDK_PYTHON=$(pyenv which python)
