# Terminal should really set this rather than shell, but Terminator is bad at this
TERM=xterm-256color
# allow ctrl+s for forward reverse in reverse-search)
stty -ixon

if [ -f /usr/local/share/chruby/chruby.sh ]; then
  source /usr/local/share/chruby/chruby.sh
  chruby 2.6
  source /usr/local/share/chruby/auto.sh
fi

if [ -f ~/Code/bash_scripts/command_line/otb_navigation.sh ]; then
  source ~/Code/bash_scripts/command_line/otb_navigation.sh
fi

if [ -f ~/Code/bash_scripts/command_line/otb_known_hosts_update.sh ]; then
  source ~/Code/bash_scripts/command_line/otb_known_hosts_update.sh
fi

if [ -f ~/Code/bash_scripts/command_line/who_deployed.sh ]; then
  source ~/Code/bash_scripts/command_line/who_deployed.sh
fi

if [ -f ~/.nvmrc ]; then
  source ~/.nvmrc
fi

# Helpful general aliases
alias pbcopy="xclip -selection clipboard"
alias be="bundle exec"
alias fs="foreman start"
alias ocred="cat ~/Documents/otb_various_credentials.txt"
alias acred="cat ~/Documents/otb_amazon_resource_creds.txt"

alias ls='ls --color=auto -GF'
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# git aliases
alias gs="git status"
alias gb="git branch"
alias gd="git diff"
alias gl="git log"
alias gp="git pull"
alias gg="git grep"
alias glogm="git log --author='Mark Maxwell'"

# colors for bash prompt
PURPLE="\[\033[38;5;69m\]"
DPURPLE="\[\033[38;5;57m\]"
BPURPLE="\[\033[38;5;93m\]"
BLUE="\[\033[38;5;45m\]"
DBLUE="\[\033[38;5;57m\]"
MAGENTA="\[\033[38;5;198m\]"
BTURQ="\[\033[38;5;51m\]"
GTURQ="\[\033[38;5;50m\]"
TGREEN="\[\033[38;5;122m\]"
ORANGE="\[\033[38;5;202m\]"

export PS1="\n $BLUE\t\n $PURPLE\w$MAGENTA\$(ruby_prompt)$BTURQ\$(parse_git_branch)$PURPLE ∫\[\033[0m\] "
export EDITOR=vim

# change ls command directory color
LS_COLORS=$LS_COLORS:'di=1;35:' ; export LS_COLORS

function parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function ruby_prompt() {
  ruby -v 2> /dev/null | sed -e 's/ruby//g; s/p.*//g'
  #echo $RUBY_VERSION 2> /dev/null
}
