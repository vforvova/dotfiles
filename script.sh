#!/bin/usr/bash

# Atom
rm $HOME/.atom/config.cson
ln -s $HOME/dotfiles/.atom/config.cson $HOME/.atom/

rm $HOME/.atom/keymap.cson
ln -s $HOME/dotfiles/.atom/keymap.cson $HOME/.atom/

rm $HOME/.atom/snippets.cson
ln -s $HOME/dotfiles/.atom/snippets.cson $HOME/.atom/
