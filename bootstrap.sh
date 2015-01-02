#!/bin/bash

# Set up dotfiles to standard locations (mostly in home directory)

echo -e "Setting up dotfiles:"

# get the directory of this script.
DOTFILES_DIR="$( cd "$( dirname "$0" )" && pwd)"
echo "Location of dotfiles directory:"
echo $DOTFILES
echo "Location of home directory:"
echo $HOME

# add zsh prompt to oh-my-zsh for autoloading
cp $DOTFILES_DIR/adh.zsh-theme $DOTFILES_DIR/oh-my-zsh/themes/.

# bash config
ln -s $DOTFILES_DIR/bash_aliases $HOME/.bash_aliases
ln -s $DOTFILES_DIR/bash_logout $HOME/.bash_logout
ln -s $DOTFILES_DIR/bashrc $HOME/.bashrc

# terminator config
ln -s $DOTFILES_DIR/terminator_config $HOME/.config/terminator/config

# tmux config
ln -s $DOTFILES_DIR/tmux.conf $HOME/.tmux.conf

# zsh config
ln -s $DOTFILES_DIR/zsh_aliases $HOME/.zsh_aliases
ln -s $DOTFILES_DIR/zshrc $HOME/.zshrc

echo -e "Set up of dotfiles complete."
