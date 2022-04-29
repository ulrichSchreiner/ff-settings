#!/bin/bash

SETTINGS=$HOME/.config/ff-settings

mkdir -p $SETTINGS

if test -f "$SETTINGS/user.js"; then
    for d in $HOME/.mozilla/firefox/*.default/ ; do
        if test -f "$d/user.js"; then
            if [ "$(readlink -- "$d/user.js")" = $SETTINGS/user.js ]; then
                echo $d/user.js already symlinked to $SETTINGS/user.js
            else
                echo $d/user.js exists with value, not changing
            fi
        else
            cd $d
            ln -s $SETTINGS/user.js
            echo $d/user.js symlinked to $SETTINGS/user.js
        fi
    done
    echo Now set config for waterfox ...
    for d in $HOME/.waterfox/*-default/ ; do
        if test -f "$d/user.js"; then
            if [ "$(readlink -- "$d/user.js")" = $SETTINGS/user.js ]; then
                echo $d/user.js already symlinked to $SETTINGS/user.js
            else
                echo $d/user.js exists with value, not changing
            fi
        else
            cd $d
            ln -s $SETTINGS/user.js
            echo $d/user.js symlinked to $SETTINGS/user.js
        fi
    done    
fi

