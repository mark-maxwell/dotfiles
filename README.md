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
- `feh` for image viewing, specifically background/lock screen images
- `mogrify` for resizing and converting images
- `scrot` for screenshots
- `ffmpeg` for video capture
- `unclutter-xfixes` for hiding mouse when inactive (unclutter-xfixes instead of standard unclutter otherwise it causes issues focusing windows with i3wm)

## TODO
Create install script for packages and symlink creation.
