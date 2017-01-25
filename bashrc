export EDITOR='vim'

export PATH=/usr/local/sbin:usr/texbin:/usr/local/bin:$HOME/Library/Haskell/bin:$PATH
eval "$(thefuck --alias)"

export LESS_TERMCAP_md="${yellow}"
export MANPAGER='less -X'

export JAVA_HOME=$(/usr/libexec/java_home)

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL=ignoreboth:erasedups
shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell
shopt -s cmdhist
shopt -s autocd

for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done

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

hash git &>/dev/null;
if [ $? -eq 0 ]; then
    function diff() {
        git diff --no-index --color-words "$@";
    }
fi

function o() {
    if [ $# -eq 0 ]; then
        open .;
    else
        open "$@";
    fi;
}

function tre() {
    tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

function fs() {
    if du -b /dev/null > /dev/null 2>&1; then
        local arg=-sbh;
    else
        local arg=-sh;
    fi
    if [[ -n "$@" ]]; then
        du $arg -- "$@";
    else
        du $arg .[^.]* *;
    fi;
}

export PS1='   \h:\W \$ '
export SUDO_PS1='   \h:\W \$ '

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export QHOME="/usr/local/lib/q"

alias ..='c ..'

alias e='emacsclient -n'
alias v='nvim'

alias q='rlwrap q'

alias l='ls -GFh'
alias ll='l -l'

alias df='df -H'
alias du='du -ch'

alias hgp='hg push -r `hg branch`'

alias work='cd /Volumes/work/cm-workspace'

if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
     complete -o default -o nospace -F _git g;
fi

tty -s && stty werase ^- 2>/dev/null

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
