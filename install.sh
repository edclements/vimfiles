#!/bin/sh

rvm system
git submodule update --init
cd ~/.vim/bundle/command-t
rake make
