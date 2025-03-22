## Global config file for zsh.
## Load global settings, and call loading of system specific settings too.

# Add homebrew dir to path
if [[ -d /opt/homebrew/bin ]]; then
    export PATH="/opt/homebrew/bin/:$PATH"
fi

# Add run-emacs to path (before setting up aliases)
if [[ -d $HOME/Projects/run-emacs ]]; then
    export PATH="$PATH:$HOME/Projects/run-emacs"
fi

# load aliases from another file
if [[ -r ~/.zsh_aliases ]]; then
   . ~/.zsh_aliases
fi

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

# # Load plugins according to OS. Different settings for Linux and OSX.
# if [[ $LINUX -eq 1 ]]; then
#     plugins=(autojump command-not-found gem git git-annex pip ruby rvm tmux
#              tmuxinator)
# fi
# if [[ $MACOS -eq 1 ]]; then
#     plugins=(
#         # autojump
#         bgnotify
#         brew
#         bundler
#         # cask
#         colored-man-pages
#         docker
#         gem
#         git
#         macos
#         nvm
#         pip
#         python
#         # ripgrep
#         ruby
#         rvm
#         tmux
#         tmuxinator
#         vagrant
#     )
# fi

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
    export PATH="$HOME/.local/bin:$PATH"
fi

# zmv for batch file renaming
autoload zmv

# set python path to find modules in PythonTools directory
if [[ -d $HOME/Projects/PythonTools ]]; then
    export PYTHONPATH="$PYTHONPATH:$HOME/Projects/PythonTools"
fi

# don't let VIRTUALENV modify my prompt. I'll do that myself thanks.
# export VIRTUAL_ENV_DISABLE_PROMPT="TRUE"

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
if [[ -d $HOME/Projects/colouring-in-creator ]]; then
    export PATH="$PATH:$HOME/Projects/colouring-in-creator"
    export FPATH="$FPATH:$HOME/Projects/colouring-in-creator"
fi
if [[ -d $HOME/Projects/cic ]]; then
    export PATH="$PATH:$HOME/Projects/cic"
    export FPATH="$FPATH:$HOME/Projects/cic"
fi
# add latex package and class directory to path
if [[ -d $HOME/Projects/LaTeXClasses ]]; then
    export PATH="$PATH:$HOME/Projects/LaTeXClasses"
    export FPATH="$FPATH:$HOME/Projects/LaTeXClasses"
fi


# set maildir directory
export MAILDIR="$HOME/.mail"

# set colours for ls command
# See ls man page under LSCOLORS for settings details
export LSCOLORS="gxfxcxdxbxegedabagacad"

# enable zsh expansion for cask, the emacs package manager
export FPATH="$HOME/dotfiles/:$HOME/dotfiles/zsh-completion/:$FPATH"
autoload -Uz compinit && compinit -u

# Function to open a man page in Preview as a pdf
function manpdf {
    # $1 is man page to view
    man -t $1 | open -fa Preview
}

# # Set up for pyenv, managing python versions
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# Google cloud SDK set up
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/adh/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/adh/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/adh/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/adh/google-cloud-sdk/completion.zsh.inc'; fi

export CLOUDSDK_PYTHON=$(pyenv which python)

# add go to path
if [[ -d /usr/local/go/bin ]]; then
    export PATH="$PATH:/usr/local/go/bin"
fi

# add go installed binaries to path
if [[ -d $HOME/go/bin ]]; then
    export PATH="$PATH:$HOME/go/bin"
fi

# Add homebrew installed package zsh completion functions
# export FPATH="/usr/local/share/zsh/site-functions/:$FPATH"
export FPATH="/opt/homebrew/share/zsh/site-functions/:$FPATH"

# Add ~/.local/bin directory to path if it exists
if [[ -d $HOME/.local/bin ]]; then
    export PATH="$PATH:$HOME/.local/bin"
fi

# Add zfunc directory to FPATH for zsh completions
if [[ -d $HOME/dotfiles/zfunc ]]; then
    export FPATH="$HOME/dotfiles/zfunc:$FPATH"
fi

# Add nvm for managing node versions
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Add PostgreSQL 16 homebrew to path
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"

# Enable starship prompt
eval "$(starship init zsh)"
