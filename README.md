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

## Additional tools and required packages
- `urxvt` for great, simplistic unicode terminal emulator
- `feh` for image viewing, specifically background/lock screen images
- `mogrify` for resizing and converting images
- `scrot` for screenshots
- `ffmpeg` for video capture
- `unclutter-xfixes` for hiding mouse when inactive (unclutter-xfixes instead of standard unclutter otherwise it causes issues focusing windows with i3wm)
- `gcolor2` for color picker tool
- `arandr` for GUI to set (and set preset) xrandr config easily
- `lxappearance`, `gtkchtheme`, `qtconfig-qt4` for changing gtk 2.0 and 3.0 themes

## Misc (non tech changes)
- set Chrome theme to gtk+ to use same gtk theme

## TODO
Create install script for packages and symlink creation.
