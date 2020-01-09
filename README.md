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
- `scrot` for screenshots
- `ffmpeg` for video capture

## TODO
Create install script or wiki section describing list of necessary dependencies to install programs that use these dotfiles, e.g. what is required to compile Vim with clipboard and python support.
