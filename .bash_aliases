# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    #alias ls='ls --color=auto'
    LSCOLORS='--color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ls='ls -h $LSCOLORS'
alias ll='ls -l'
alias la='ls -la'

#su/sudo
alias s='su -'
alias ash='sudo aptsh'

#other
alias cdrepos='cd ~/repos'
alias ge='gedit'
gvim () { command gvim --remote-silent $@ || command gvim $@; }

if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi
