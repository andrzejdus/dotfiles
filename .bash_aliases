# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #BASH_ALIASES_LSCOLORS='--color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -l'
alias la='ls -la'

#su/sudo
alias s='su -'
alias ash='sudo aptsh'

#other
alias cdrepos='cd ~/important/share/repos'
alias ge='gedit'
function tvim() { uxterm -e vim "$@" ; }

# ssh servers
