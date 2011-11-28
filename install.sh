#!/bin/sh

rvm system
ln -s ~/.vim/vimrc ~/.vimrc
git submodule update --init
cd ~/.vim/bundle/command-t
rake make
