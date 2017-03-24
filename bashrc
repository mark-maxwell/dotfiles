# current git branch on command line
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

function rvm_prompt {
  ~/.rvm/bin/rvm-prompt | sed -e 's/ruby-//g'
}

PURPLE="\[\033[38;5;99m\]"
DPURPLE="\[\033[38;5;57m\]"
BPURPLE="\[\033[38;5;93m\]"
DBLUE="\[\033[38;5;57m\]"
MAGENTA="\[\033[38;5;198m\]"
BTURQ="\[\033[38;5;51m\]"
GTURQ="\[\033[38;5;50m\]"
TGREEN="\[\033[38;5;122m\]"
ORANGE="\[\033[38;5;202m\]"

export PS1="$DPURPLE--------- $DPURPLE\t$DPURPLE ---------\n $PURPLE\w $MAGENTA\$(rvm_prompt)$BTURQ\$(parse_git_branch)$DPURPLE ∫\[\033[0m\] "
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="/usr/local/heroku/bin:$PATH" ### Added by the Heroku Toolbelt
export EDITOR='vim'

# alias lock='/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend'
alias lock='open -a /System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'
alias subl="open -a 'Sublime Text 2'"

# better ls = directories in color
alias ls='ls -G'

# grep with color
alias grep='grep --color=auto'

# naughty shortcuts
alias be="bundle exec"
alias fs="bundle exec foreman start"

# git
alias gs="git status"
alias gb="git branch"
alias gd="git diff"
alias gp="git pull"
alias glog='git log --oneline --abbrev-commit --all --graph --decorate'
alias glogm="git log --author='Mark Maxwell'"
alias gslog="git log --format='%Cred%h%Creset %s %Cgreen(%cr) %C(blue)<%an>%Creset%C(yellow)%d%Creset' --no-merges"

# generate ctags for ruby projects
alias genctags="ctags --exclude=public --exclude=_html --exclude=tmp --exclude=log --exclude=coverage --exclude=vendor/bundle --extra=+f -R *"
