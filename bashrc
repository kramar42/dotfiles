export EDITOR='vim'

export LESS_TERMCAP_md="${yellow}"
export MANPAGER='less -X'

#export JAVA_HOME=$(/usr/libexec/java_home)
#export _JAVA_AWT_WM_NONREPARENTING=1
#export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=on"
#export AWT_TOOLKIT=MToolkit
#export JDK_JAVA_OPTIONS='-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel'
#export _JAVA_OPTIONS='-Dsun.java2d.opengl=true'

export GOPATH=$HOME/code/go

export PATH=$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$PATH

export DJEM_HOME=$HOME/code/djem
export BLUEGLUE_HOME=$HOME/code/blueglue

export MONITOR="DP-0"

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

alias t='tmux attach'

alias e='emacsclient -n'
alias v='vim'

alias q='rlwrap q'

alias l='ls -GFh'
alias ll='l -l'
alias la='l -la'

alias df='df -H'
alias du='du -ch'

alias fbg='feh --no-fehbg --bg-center https://thisartworkdoesnotexist.com/'

if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
     complete -o default -o nospace -F _git g;
fi

tty -s && stty werase ^- 2>/dev/null

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
