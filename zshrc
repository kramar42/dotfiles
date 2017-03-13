export ZSH=/Users/kramar/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
DISABLE_AUTO_TITLE="true"
export PATH="/usr/local/sbin:usr/texbin:/usr/local/bin:/Users/kramar/Library/Haskell/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin:/Library/TeX/texbin:/usr/local/sbin:usr/texbin:/Users/kramar/Library/Haskell/bin"

export EDITOR='vim'
export SSH_KEY_PATH="~/.ssh/dsa_id"
export LESS_TERMCAP_md="${yellow}"
export MANPAGER='less -X'

export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export QHOME="/usr/local/lib/q"

export HOMEBREW_GITHUB_API_TOKEN=b58c1c1ed918178b3fb7a6efff56f9b4d2e1f999
export JAVA_HOME=$(/usr/libexec/java_home)

plugins=(git mercurial)

alias -s hs=vim

alias repl='rlwrap repl'

alias e='emacsclient -n'
alias v='vim'
alias m='mvim'

alias q='rlwrap q'

alias l='ls -GFh'
alias ll='l -l'

alias df='df -H'
alias du='du -ch'

alias hgp='hg push -r `hg branch`'
alias hgd='hg diff --color=always | less -R'

alias work='cd /Volumes/work/dam_plugins/hddvr-plugin'
eval "$(thefuck --alias)"

alias upgrade='softwareupdate --install --all;
               brew update && brew upgrade --all;
               brew cleanup; brew doctor;
               brew cask cleanup;
               npm update -g;'

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

export PS1='   %m:%1d $(prompt_char) '

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
