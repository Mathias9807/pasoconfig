#!/bin/bash

# Symlink config-files into home-directory
ln -s ~/.repos/pasoconfig/tmux.conf ~/.tmux.conf
ln -s ~/.repos/pasoconfig/vim ~/.vim

mkdir -p ~/.config/gdb
ln -s ~/.repos/pasoconfig/gdb.conf ~/.config/gdb/gdbinit

