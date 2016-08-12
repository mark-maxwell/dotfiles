# Dotfiles

## .vimrc
### Loading vimrc

Vim will look inside ~/.vim/ automatically for a vimrc file.
Create a symlink to the version controlled vimrc file:
```
ln -s <path_to_vimrc_in_cloned_repo> ~/.vim/vimrc
```

### Installing plugins
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

Open vim and:
```
:PluginInstall
```

###_Other vim setup for fresh install:_
*Place the following in an .<file_name>rc file to be loaded when initializing shell.*
```
export EDITOR='vim'
```

_Set editor used when creating git commits:_
```
which vim
```
_then..._
```
vim ~/.gitconfig
#set "editor" to output ^
```
