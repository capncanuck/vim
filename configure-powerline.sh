#!/bin/bash

# Install powerline
# https://powerline.readthedocs.org/en/latest/overview.html#installation
# https://powerline.readthedocs.org/en/latest/tipstricks.html#vim

# For VIM usage only

if [[ -d "bundle/powerline" ]]; then
    echo "The powerline bundle already exists"
else
    echo "Need to install the powerline bundle. Adding as submodule"

    git submodule add git://github.com/Lokaltog/powerline bundle/powerline
    echo "set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim" >> ~/.vim/vimrc
fi

# 1. Install the new font: InconsolataPowerline.otf
# 2. Noop: The font has already been added to gvimrc
# 3. Set the terminal font in iterm2 to "Inconsolata for Powerline" - 16

