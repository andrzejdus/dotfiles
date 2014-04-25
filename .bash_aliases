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
# source https://github.com/elliottcable/System/blob/Master/Dotfiles/profile#L180-L189
alias g='git'
alias gs='g status'
alias gist='g diff -M -C --find-copies-harder -l64 --stat --cached --color | sed -E "s/^(.*)\|/`echo -en '\''\e[32m'\''`\1`echo -en '\''\e[00m'\''`|/" && g diff -M -C --find-copies-harder -l64 --stat --color | sed -E "s/^(.*)\|/`echo -en '\''\e[31m'\''`\1`echo -en '\''\e[00m'\''`|/" && g ls-files --others --directory --no-empty-directory --exclude-standard | sed -E "s/^(.*)$/ `echo -en '\''\e[33m'\''`\1`echo -en '\''\e[00m'\''`/"'
alias gull='g pull'
alias gush='g push'
alias gad='g add'
alias germ='g rm'
alias glean='g clean'
alias go='g co'
alias gin='g ci'
alias ganch='g branch'
alias clanch='git symbolic-ref HEAD "refs/heads/$1" && rm -f ".git/index" && git clean -fdx'
alias gash='g stash'
alias giff='g diff --patch-with-stat -M -C --find-copies-harder -l64'
alias gifft='g difftool'
alias gerget='g mergetool'
alias gl='git log --oneline --abbrev-commit --all --graph --decorate --color'

if [ -f ~/.bash_aliases_private ]; then
    . ~/.bash_aliases_private
fi
