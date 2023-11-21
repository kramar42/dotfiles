
#THIS BREAKS GIT CLONING OVER SSH
#cat /home/kramar/.cache/wal/sequences

### PATHS

export QHOME="/usr/local/lib/q"
export GOPATH=$HOME/code/go
export JAVA_HOME=$(java-config --select-vm=graalvm-11 -O)
export PATH=$HOME/bin:$HOME/.local/bin:$JAVA_HOME/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.krew/bin:$PATH:/usr/lib64/qt5/bin
export GRAALVM_HOME='/Users/kramar/Code/build/graalvm/Contents/Home/'
#export PATH=/usr/local/sbin:/usr/local/bin:$GRAALVM_HOME/bin:$HOME/.cargo/bin:$PATH


### EXPORTS

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export EDITOR='nvim'
export LESS_TERMCAP_md="${yellow}"
export MANPAGER='less -X'
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# TODO needed this for xclip
#export DISPLAY=:0.0
export MONITOR="DP-0"
export NO_AT_BRIDGE=1
export LIBVA_DRIVER_NAME=nvdec

export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"
export HISTFILE=$HOME/.cache/bash.history
export HISTCONTROL=ignoreboth:erasedups
export LESSHISTFILE=$HOME/.cache/less.history
export NODE_REPL_HISTORY=$HOME/.cache/node.history
export PSQL_HISTORY=$HOME/.cache/psql.history
export PYTHONHISTORY=$HOME/.cache/python.history

### BASH OPTS

shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell
shopt -s cmdhist
shopt -s autocd

for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done

### FUNCTIONS

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

### PROMPT

export PS1='╟⸻⸻⸻⸻⸻⸻⸻⸻⸻⸻\n║ \h:\w\n╟─╼ '
export PS1='  \h:\w\n> '
export SUDO_PS1='   \h:\W \$ '

function prompt_right() {
  echo -e "\033[0;36m\\\t \033[0m"
}

function prompt_left() {
  echo -e "\033[0;35m \h:\w\033[0m"
}

function prompt() {
    compensate=5
    PS1=$(printf "%*s\r%s\n > " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
}
PROMPT_COMMAND=prompt

### ALIASES

alias ..='c ..'

alias t='tmux attach'

alias e='emacsclient -n'
alias v='nvim'

alias q='rlwrap q'

alias l='ls -GFh'
alias ll='l -l'
alias la='l -la'

alias df='df -H'
alias du='du -ch'

alias fbg='feh --no-fehbg --bg-center https://thisartworkdoesnotexist.com/'

alias r='ranger'
alias k='kubectl'

alias pbcopy='xclip -sel clip'

### AUTOCOMPLETE

if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
     complete -o default -o nospace -F _git g;
fi

tty -s && stty werase ^- 2>/dev/null
source <(kubectl completion bash)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.config/broot/launcher/bash/br ] && source ~/.config/broot/launcher/bash/br

