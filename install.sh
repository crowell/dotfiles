#!/bin/bash
ln -s `pwd`/tmux.conf ~/.tmux.conf
ln -s `pwd`/vimrc ~/.vimrc
ln -s `pwd`/radare2rc ~/.radare2rc
ln -s `pwd`/gitconfig ~/.gitconfig
mkdir -p ~/.config/nvim
ln -s `pwd`/init.vim ~/.config/nvim/init.vim
ln -s `pwd`/wezterm.lua ~/.wezterm.lua
ln -s `pwd`/zshrc ~/.zshrc
