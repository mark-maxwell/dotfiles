# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists

# set PATH so it includes user's local bin if it exists
if [ -d "$HOME/local/bin" ] ; then
  export PATH="$HOME/local/bin:$PATH"
fi

# Homebrew is installed in opt/ for apple silicon laptops
export PATH=$PATH:/opt/homebrew/bin:/opt/homebrew/Cellar
export PATH="/opt/homebrew/opt/mysql@8.0/bin:$PATH"

# Silence Mac warnings about switching to zsh when terminal starts
export BASH_SILENCE_DEPRECATION_WARNING=1

# Prevents error in multithreaded apps due to Mac security restrictions
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

source ~/.bashrc
