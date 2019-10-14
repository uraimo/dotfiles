# Dotfiles

My .vimrc and other dotfiles, they will work on both macOS and Linux.

## Contents

* `.fonts/` - Terminal/Vim fonts, install them with the provided script.
* `.vimrc` & `.vim/` - Vim/Gvim/MacVim configuration, initialize the plugin with `initplugins.sh`.
* `.tmux.conf` - Tmux configuration.
* `.iterm2/` - Dark Color schemes for iTerm2.
* `.gitconfig` - Some useful aliases and git presets, configure you global git properties here(username, git key, etc...).
* `.bash_profile_append` - Old .bash_profile, unmaintained.
* `.zshrc_append` - Current zsh profile.

## Dependencies

```
    brew install ripgrep fzf git-delta
```

You should manually install zgen: `https://github.com/tarjoilija/zgen`, a package manager for zsh.

## GIT Alias

* `ad`: Stage everything for the current directory, added,modified,removed.
* `gst`: Quicker status.
* `l50`/`lg50`, `l80`/`lg80`: Colorized compact log.


## VIM Plugins

I'm using: vim-airline, syntastic, fzf-vim and taglist. All configured as git submodules that can be installed with `initplugins.sh` or directly cloning the main repository with `git clone --recurse-submodules <...>`.

A few new shortcuts are available (`,` is the leader key):

* `,t`: Open the taglist window;
* `,f`: Open directory tree;
* `,e`: Close the syntastic window;
* `,h`: Hex mode;
* `,I`: Show the indent guides;
* `CTRL+g`: Search for a stringin all the files from the current directory (fzf/rg);
* `CTRL+p`: Search a file from the current directory (fzf/rg);
* `F3`: Show/hide the line numbers;
* `F6`: Spellcheck;
* `,/`: Search and replace with confirmation.


