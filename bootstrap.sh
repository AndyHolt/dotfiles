#!/bin/bash

# Set up dotfiles to standard locations (mostly in home directory)

echo -e "Setting up dotfiles:"

DOTFILES_DIR=$(pwd)

# add zsh prompt to oh-my-zsh for autoloading
cp $DOTFILES_DIR/adh.zsh-theme $DOTFILES_DIR/oh-my-zsh/themes/.

# bash config
ln -s $DOTFILES_DIR/bash_aliases ~/.bash_aliases
ln -s $DOTFILES_DIR/bash_logout ~/.bash_logout
ln -s $DOTFILES_DIR/bashrc ~/.bashrc

# terminator config
ln -s $DOTFILES_DIR/terminator_config ~/.config/terminator/config

# tmux config
ln -s $DOTFILES_DIR/tmux.conf ~/.tmux.conf

# zsh config
ln -s $DOTFILES_DIR/zsh_aliases ~/.zsh_aliases
ln -s $DOTFILES_DIR/zshrc ~/.zshrc

echo -e "Set up of dotfiles complete."
