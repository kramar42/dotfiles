
# TODO THIS BREAKS GIT CLONING OVER SSH
#cat /home/kramar/.cache/wal/sequences

### PATHS

export GOPATH=$HOME/code/go
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  export JAVA_HOME=$(java-config --select-vm=openjdk-bin-21 -O) # lsp requires 21
elif [[ "$OSTYPE" == "darwin"* ]]; then
fi
export KUBECONFIG=$HOME/.kube/config
export PATH=$HOME/bin:$HOME/.local/bin:$GOPATH/bin:$HOME/.cargo/bin:$HOME/.krew/bin:/usr/lib64/qt5/bin:$JAVA_HOME/bin:$HOME/.tmux/plugins/t-smart-tmux-session-manager/bin:$PATH

### EXPORTS

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export EDITOR="nvim"
export MANPAGER="less -X"
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# TODO needed this for xclip
#export DISPLAY=:0.0
export MONITOR="DP-0"
export NO_AT_BRIDGE=1
export LIBVA_DRIVER_NAME=nvdec

export HISTCONTROL="ignoreboth:erasedups"
export HISTSIZE="32768"
export HISTFILESIZE="${HISTSIZE}"
export HISTFILE=$HOME/.cache/bash.history
export LESSHISTFILE=$HOME/.cache/less.history
export NODE_REPL_HISTORY=$HOME/.cache/node.history
export PSQL_HISTORY=$HOME/.cache/psql.history
export PYTHONHISTORY=$HOME/.cache/python.history

### BASH OPTS

shopt -s autocd
shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s globstar
shopt -s histappend

### PROMPT
export SUDO_PS1="   \h:\W \$ "

function prompt_right() { echo -e "\033[0;36m\\\t \033[0m" ; }
function prompt_left()  { echo -e "\033[0;35m \h:\w\033[0m"; }

function prompt() {
  compensate=5
  PS1=$(printf "%*s\r%s\n > " "$(($(tput cols)+${compensate}))" "$(prompt_right)" "$(prompt_left)")
}
PROMPT_COMMAND=prompt

### ALIASES

alias ..="cd .."
alias cd="z"
alias df="df -H"
alias du="du -ch"
alias fbg="feh --no-fehbg --bg-center https://thisartworkdoesnotexist.com/"
alias g="git"
alias k="kubectl"
alias l="ls -GFh"
alias la="l -la"
alias lg="lazygit"
alias p="python"
if [[ "$OSTYPE" == "linux-gnu"* ]]; then alias pbcopy="xclip -sel clip"; fi
alias r="ranger"
alias s="spotify_player"
alias v="nvim"

### AUTOCOMPLETE

if type _git &> /dev/null && [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
  complete -o default -o nospace -F _git g;
fi

tty -s && stty werase ^- 2>/dev/null

source <(kubectl completion bash)
source <(zoxide init bash)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.config/broot/launcher/bash/br ] && source ~/.config/broot/launcher/bash/br

