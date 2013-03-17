#!/bin/sh

# Clone the main repository and execute this right after to populate the plugin directories.
# After that, to update the plugins use updateplugins.sh.
git submodule init; git submodule update

# Compiles youcompleteme
cd .vim/bundle/YouCompleteMe
./install.sh --clang-completer
