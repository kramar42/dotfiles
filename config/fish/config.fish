# env variables
set -x EDITOR nvim

set -x GOPATH ~/code/go
if test "$OSTYPE" = "linux-gnu"
  set -x JAVA_HOME (java-config --select-vm=openjdk-21 -O) # lsp requires 21
end
if test "$OSTYPE" = "darwin"
  set -x JAVA_HOME (/usr/libexec/java_home -v 19)
end

# path
fish_add_path $GOPATH/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.krew/bin
fish_add_path $HOME/.tmux/plugins/t-smart-tmux-session-manager/bin
fish_add_path /opt/homebrew/bin
fish_add_path /usr/local/bin
fish_add_path /usr/local/sbin

# better cd
zoxide init fish | source

alias cd="z"
alias p="python"
alias g="git"
alias k="kubectl"
alias l="ls"
alias lg="lazygit"
alias ll="ls -lh"
alias r="ranger"
alias v="nvim"

# prompt
set fish_greeting
function fish_prompt
    echo "("(prompt_pwd)") λ "
end

function setver --wraps mvn --description 'alias ...'
    mvn versions:set -DgenerateBackupPoms=false -DnewVersion=$argv
end

function battery-sleep
    if test "$argv" = "off"
        echo "don't sleep on battery"
        command sudo pmset -b disablesleep 1
    else
        echo "sleep on battery"
        command sudo pmset -b disablesleep 0
    end
end

function upgrade
    command sudo softwareupdate -i -a
    command brew update
    command brew upgrade
    command brew cleanup
    command brew doctor
    command npm install npm -g
    command npm update -g
    command pip-review --auto
    command sudo gem update --system -n /usr/local/bin
    command sudo gem update -n /usr/local/bin
    command sudo gem cleanup -n /usr/local/bin
end

