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

# su/sudo
alias s='su -'
alias ash='sudo aptsh'

# android
alias androidc='adb reboot bootloader; make -j8 && fastboot flash system && fastboot reboot'

# other
alias cdrepos='cd ~/repos'
alias ge='gedit'

# git
alias g='git'
alias gs='git status'
alias gull='git pull'
alias gush='git push'
alias gd='git diff'
alias ga='git add'
alias gau='git add --update'
alias gci='git commit -v'
alias gcia='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogg='git log --oneline --abbrev-commit --all --graph --decorate --color'

if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi
