#!/bin/bash

if shopt -q login_shell; then
    [[ -f ~/.bashrc ]] && . ~/.bashrc
    [[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && exec startx
    [[ -t 0 && $(tty) == /dev/tty2 && ! $DISPLAY ]] && openbox-session
else
    exit 1
fi
