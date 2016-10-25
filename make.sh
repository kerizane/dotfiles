#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="gitconfig tmux.conf inputrc bashrc vimrc vim profile bash_profile zshrc Xresources"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

# move any existing real dotfiles in homedir to dotfiles_old directory, then (re)create symlinks 
for file in $files; do
	if [ -L ~/.$file ]; then
		unlink ~/.$file
	elif [ -d ~/.$file ]; then
		mv ~/.$file $olddir
	fi
	ln -s $dir/$file ~/.$file
done


if command -v xrdb >/dev/null 2>&1;then
	#xrdb exists
	xrdb -merge ~/.Xresources 
fi


vundle_path=vim/bundle/Vundle.vim
if [ ! -d "$vundle_path" ];then
	git clone ssh://git@github.com/VundleVim/Vundle.vim.git $vundle_path
fi
