# Dotfiles

## Creating symbolic links
- clone repo
- `cd` into cloned repo
- create symbolic links for each file: `ln -s <path_to_file_in_repo> <path_to_target_location>

## Xresources
`xrdb ~/.Xresources` to load changes to config file.

## i3
`i3-msg reload`

## Vim
`:so %`

- Symlink vimrc to ~/.vim/vimrc
- Symlink vim/after/plugin/colorscheme.vim to ~/.vim/after/plugin/colorscheme.vim
- `ack` dependency install required for ack.vim plugin

## NeoVim
- Symlink vimrc to ~/.config/nvim/init.vim

## Yabai
- Symlink yabairc to ~/.config/yabai/yabairc
`yabai --start-service`
`yabai --restart-service`

## Aerospace
- Symlink aerospace.toml to ~/.config/aerospace/aerospace.toml
- Start via standard Mac spotlight application search
NOTE: Make sure skhd is not running as the keyboard shortcuts will be intercepted.

### skhd
- Symlink skhdrc to ~/.config/skhd/skhdrc
- `skhd --stop-service`

## Tmux
- Symlink tmux.conf to ~/.tmux.conf
NOTE: For Mac, the default shortcut for changing the keyboard input source (e.g.
from UK to US keyboard layout) is CTRL+SPACE which clashes with the custom Tmux
leader key - preventing Tmux shortcuts from working - so the Mac shortcut must
be bound to something else.

## Additional tools and required packages
- `ctags`
- `urxvt` for great, simplistic unicode terminal emulator
- `git-completion.bash` copied from official git github repo to `~/.git-completion.bash`
- `feh` for image viewing, specifically background/lock screen images
- `mogrify` for resizing and converting images
- `scrot` for screenshots
- `ffmpeg` for video capture
- `unclutter-xfixes` for hiding mouse when inactive (unclutter-xfixes instead of standard unclutter otherwise it causes issues focusing windows with i3wm)
- `gcolor2` for color picker tool
- `arandr` for GUI to set (and set preset) xrandr config easily
- `lxappearance`, `gtkchtheme`, `qtconfig-qt4` for changing gtk 2.0 and 3.0 themes
- `volumeicon-alsa` for volume icon in status bar (volumeicon command in i3config)
- `nethogs` for top-like real-time view of network bandwidth usage per process

## Misc (non tech changes)
- set Chrome theme to gtk+ to use same gtk theme

## Mac
- DefaultKeyBinding.dict copied to ~/Library/KeyBindings/DefaultKeyBinding.dict
  - Stops ctrl+v acting as page down in some applications!
- (`yabai` and `skhd`) OR aerospace for window manager
- `Alacritty` for terminal
- `shottr` for screenshots
- `caffeine` to prevent laptop sleeping
- `MongoDB Compass`
- `FileZilla` for FTP

## TODO
Create install script for packages and symlink creation.
