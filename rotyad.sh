#!/bin/bash

function get_rotation() {
    xrandr -q --verbose | 
        grep 'connected' | 
        egrep -o  '\) (normal|left|inverted|right) \(' | 
        egrep -o '(normal|left|inverted|right)'
}

function make_rotation() {
    echo "rotation ok"
    exit 0
}

function toggle_keyboard() {
    echo "keyboard ok"
    exit 0
}

yad --undecorated --center \
    --button='gtk-refresh':'1' --button='gtk-select-font':'2'

ret=$?

case $ret in
    1) make_rotation ;;
    2) toggle_keyboard ;;
    *) exit 1 ;;        
esac

