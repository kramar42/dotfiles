#!/bin/bash

if shopt -q login_shell; then
    [[ -f ~/.bashrc ]] && . ~/.bashrc
    [[ -t 0 && $(tty) == /dev/tty1 && ! $DISPLAY ]] && exec startx -- vt1
else
    exit 1
fi

