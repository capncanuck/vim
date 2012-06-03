VIM Settings
============

    git clone https://github.com/juretta/vim.git .vim

Prerequisites:

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

In ~/.vim run

    git submodule init
    git submodule update

Bundle managment
----------------

In ~/.vim

Add a new bundle:

    git submodule add http://example.com/bundle.git bundle/BUNDLENAME
    git add bundle
    git commit -m "Add BUNDLE as a submodule"

Upgrade the bundle:

    cd ./bundle/BUNDLENAME
    git pull
    
