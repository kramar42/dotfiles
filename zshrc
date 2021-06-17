export ZSH=/Users/kramar/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
DISABLE_AUTO_TITLE="true"

export EDITOR='nvim'
export SSH_KEY_PATH="~/.ssh/dsa_id"
export LESS_TERMCAP_md="${yellow}"
export MANPAGER='less -X'

export MOSH_TITLE_NOPREFIX=1

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'
export LC_CTYPE='en_US.UTF-8'

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export QHOME="/usr/local/lib/q"

export HOMEBREW_GITHUB_API_TOKEN=b58c1c1ed918178b3fb7a6efff56f9b4d2e1f999
export JAVA_HOME=$(/usr/libexec/java_home)

plugins=(git mercurial osx)

export GOPATH="${HOME}/.go"
export GOROOT="/usr/local/opt/go/libexec"

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/users/kramar/code/scripts/sh:$PATH"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"
#export PATH="$PATH:/Library/Java/JavaVirtualMachines/graalvm-ce-java8-20.0.0/Contents/Home/bin"

plugins=(git kubectl osx)

alias -s hs=vim

alias repl='rlwrap repl'

alias e='emacsclient -n'
alias v='nvim'
alias m='mvim'
alias t='tmux attach -t'

alias q='rlwrap q'

alias l='ls -GFh'
alias ll='l -l'

alias df='df -H'
alias du='du -ch'


# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm, and their installed packages
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update; sudo gem cleanup'

alias upgrade='softwareupdate --install --all;
               brew update && brew upgrade; brew cleanup; brew doctor;
               npm update -g;
               pip-review --auto;
               sudo gem update --system; sudo gem update; sudo gem cleanup
               '
#stack update; stack upgrade;

alias graph="git log --all --color --graph --pretty=format:'%Cred%h%Cgreen(%cr) -%C(yellow)%d%Creset %s %C(bold blue)<%an>' --abbrev-commit"
alias g='git'

fpath=(/usr/local/share/zsh-completions $fpath)

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

function d() {
    cd "$@";
    l;
}

# c - browse chrome history
c() {
  local cols sep
  cols=$(( COLUMNS / 3 ))
  sep='{{::}}'

  # Copy History DB to circumvent the lock
  # - See http://stackoverflow.com/questions/8936878 for the file path
  cp -f ~/Library/Application\ Support/Google/Chrome/Default/History /tmp/h

  sqlite3 -separator $sep /tmp/h \
    "select substr(title, 1, $cols), url
     from urls order by last_visit_time desc" |
  awk -F $sep '{printf "%-'$cols's  \x1b[36m%s\n", $1, $2}' |
  fzf --ansi --multi | sed 's#.*\(https*://\)#\1#' | xargs open
}

function prompt_char {
    git branch >/dev/null 2>/dev/null && echo '±' && return
    echo 'λ'
}

#export PS1=$'   %m:%1d \e[0;32m$(prompt_char)\e[0m '
export PS1=$'   %m:%1d $(prompt_char) '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

precmd() {
  # sets the tab title to current dir
  echo -ne "\e]1;${PWD##*/}\a"
}
