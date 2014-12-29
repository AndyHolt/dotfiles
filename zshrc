# Path to your oh-my-zsh configuration.
ZSH=$HOME/dotfiles/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="prose"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [[ -r ~/.zsh_aliases ]]; then
   . ~/.zsh_aliases
fi

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(autojump command-not-found gem git git-annex pip ruby rvm tmux tmuxinator)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

bindkey -e

setopt nohup

export EDITOR='emacsclient -c -a=""'

# tmux powerline set up stuff
export PATH="$HOME/.local/bin:$PATH"

# set up tmuxinator completion (now done by plugin)
# source ~/dotfiles/tmuxinator_completion.zsh

# autostart tmux when starting zsh
# [todo] - zsh doesn't autoconnect to tmux. Why?
ZSH_TMUX_AUTOSTART="false"
ZSH_TMUX_AUTOCONNECT="true"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM
# into a shell session *as a function*

# add cask binary to path
export PATH="$HOME/.cask/bin:$PATH"

# zmv for batch file renaming
autoload zmv

# set some directory names to parameters for shortening in prompt
SSC=/storage/Documents/Uni/PartIIB/Sparse_sampling_control
