set -x PATH /opt/homebrew/bin $PATH /usr/local/bin /users/kramar/code/scripts/sh /users/kramar/.cargo/bin /users/kramar/code/go/bin

set fish_greeting
function fish_prompt
    echo "("(prompt_pwd)") λ "
end

#set -x JAVA_HOME (/usr/libexec/java_home -v 1.8.0)
#set -x JAVA_HOME (/usr/libexec/java_home -v 11)
#set -x JAVA_HOME '/opt/homebrew/opt/java/libexec/openjdk.jdk/Contents/Home'
set -x JAVA_HOME (/usr/libexec/java_home -v 19)
set -x GOPATH ~/code/go
set -x DJEM_HOME ~/code/djem
set -x BLUEGLUE_HOME ~/code/blueglue
set -gx PATH $PATH $HOME/.krew/bin

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function config
    command nvim ~/.config/fish/config.fish
end

alias v="nvim"
alias l="ls"
alias ll="ls -lh"
alias t="tmux"
alias g="git"
alias k="kubectl"

alias dc="docker container"
alias di="docker image"

function battery-sleep
    if test "$argv" = "off"
        echo "don't sleep on battery"
        command sudo pmset -b disablesleep 1
    else
        echo "sleep on battery"
        command sudo pmset -b disablesleep 0
    end
end
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

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

function ta
    command tmux attach
end

function e
    command emacsclient -n
end

function setver --wraps mvn --description 'alias ...'
    mvn versions:set -DgenerateBackupPoms=false -DnewVersion=$argv
end

