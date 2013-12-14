# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history
export HISTCONTROL=ignoreboth:erasedups
# append to the history file, don't overwrite it
shopt -s histappend
# check the window size after each command and, if necessary, update the
# values of LINES and COLUMNS.
shopt -s checkwinsize
# correct minor errors in the spelling of a directory component in a cd command
shopt -s cdspell
# save all lines of a multiple-line command in the same history entry (allows
# easy re-editing of multi-line commands)
shopt -s cmdhist
# don't need to print cd every time
shopt -s autocd
# special function
c() {
    cd "$@" && ls -GF
}

up() {
    dir=""
    if [ -z "$1" ]; then
        dir=..
    elif [[ $1 =~ ^[0-9]+$ ]]; then
        x=0
        while [ $x -lt ${1:-1} ]; do
            dir=${dir}../
            x=$(($x+1))
        done
    else
        dir=${PWD%/$1/*}/$1
    fi
    c "$dir";
}

# export PS1
PS1='\n[\e[0;94m\]\W\[\e[0m\]]\[\e[0;33m\] $(vcprompt -f "%b:%r") \[\e[1;91m\]$(vcprompt -f "%m%u")\[\e[0m\]\n\$ '

# grep colorize
export GREP_OPTIONS="--color=auto"
export CDPATH=.:$HOME:$HOME/Sync
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# bash aliases
alias ..='c ..'

alias e='emacsclient -n'
alias v='mvim --remote-silent'

alias q='rlwrap q'
alias j='/Applications/j701/bin/jconsole'

alias l='ls -GFh'
alias ll='l -l'

alias df='df -H'
alias du='du -ch'

alias ga='git add'
alias gm='git mv'
alias gr='git rm'
alias gl='git log'
alias gd='git diff'
alias gs='git status'
alias gc='git commit'
alias gsh='git push'
alias gll='git pull'

alias o='open'
alias wget='wget -c'

alias bl='brew list'
alias bs='brew search'
alias bi='brew install'
alias bup='brew update'
alias bu='brew upgrade'

alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

# bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f ~/Sync/dev/personal/gists/6095984/yo-completion.sh ]; then
    . ~/Sync/dev/personal/gists/6095984/yo-completion.sh
fi

if [ -f $(brew --prefix root)/libexec/thisroot.sh ]; then
    . $(brew --prefix root)/libexec/thisroot.sh
fi


# this is for delete words by ^W
tty -s && stty werase ^- 2>/dev/null

unset DYLD_LIBRARY_PATH
export GOPATH=~/.gocode

