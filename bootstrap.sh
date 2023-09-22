#!/bin/bash

# Set up dotfiles to standard locations (mostly in home directory)

# If input argument is passed, use that as user directory name
if [ "$1" != "" ]; then
    HOME_DIR="/home/$1"
else
    HOME_DIR="$HOME"
fi

echo -e "Setting up dotfiles:"

# get the directory of this script.
DOTFILES_DIR="$( cd "$( dirname "$0" )" && pwd)"
echo "Location of dotfiles directory:"
echo $DOTFILES_DIR
echo "Location of home directory:"
echo $HOME_DIR

# add zsh prompt to oh-my-zsh for autoloading
cp $DOTFILES_DIR/adh.zsh-theme $DOTFILES_DIR/oh-my-zsh/themes/.

# bash config
ln -s $DOTFILES_DIR/bash_profile $HOME_DIR/.bash_profile
ln -s $DOTFILES_DIR/bash_aliases $HOME_DIR/.bash_aliases
ln -s $DOTFILES_DIR/bash_logout $HOME_DIR/.bash_logout
ln -s $DOTFILES_DIR/bashrc $HOME_DIR/.bashrc

# terminator config
ln -s $DOTFILES_DIR/terminator_config $HOME_DIR/.config/terminator/config

# tmux config
ln -s $DOTFILES_DIR/tmux.conf $HOME_DIR/.tmux.conf

# zsh config
ln -s $DOTFILES_DIR/zsh_aliases $HOME_DIR/.zsh_aliases
ln -s $DOTFILES_DIR/zshrc $HOME_DIR/.zshrc

# offlineimap setup
ln -s $DOTFILES_DIR/offlineimaprc $HOME_DIR/.offlineimaprc

# hammerspoon setup
ln -s $DOTFILES_DIR/hammerspoon-init.lua $HOME_DIR/.hammerspoon/init.lua

# vim setup
ln -s $DOTFILES_DIR/vimrc $HOME_DIR/.vimrc

echo -e "Set up of dotfiles complete."
