#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="bashrc vimrc vim zshrc Xresources"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    mv ~/.$file $olddir
    ln -s $dir/$file ~/.$file
done

xrdb -merge ~/.Xresources
git clone ssh://git@github.com/VundleVim/Vundle.vim.git vim/bundle/Vundle.vim

git config --global core.editor $(which vim)
