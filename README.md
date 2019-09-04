# Dotfiles

My .vimrc and other dotfiles, they will work on both macOS and Linux.

## Contents

* .fonts/ - Terminal/Vim fonts, install them with the provided script.
* .vimrc & .vim/ - Vim/Gvim/MacVim configuration, initialize the plugin with `initplugins.sh`.
* .tmux.conf - Tmux configuration.
* .iterm2/ - Dark Color schemes for iTerm2.
* .gitconfig - Some useful aliases and git presets, configure you global git properties here(username, git key, etc...). 

## Dependencies

```
    brew install ripgrep fzf
```

## VIM Plugins

I'm using: vim-airline, syntastic, fzf-vim and taglist. All configured as git submodules that can be installed with `initplugins.sh` or directly cloning the main repository with `git clone --recurse-submodules <...>`.

A few new shortcuts are available (`,` is the leader key):

* `,t`: Open the taglist window;
* `,e`: Close the syntastic window;
* `,h`: Hex mode;
* `,I`: Show the indent guides;
* `CTRL+f`: Search for a stringin all the files from the current directory (fzf/rg);
* `CTRL+P`: Search a file from the current directory (fzf/rg);
* `F3`: Show/hide the line numbers;
* `F6`: Spellcheck;
* `,/`: Search and replace with confirmation.


