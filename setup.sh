#!/usr/bin/env bash

set -eo pipefail
thisdir="$(cd "$(dirname "$0")" && pwd)"

function linkto() {
    local srcs="$1"
    local dest="$2"

    # record the full path
    srcs=$(cd "$srcs" && pwd)

    # cd to the target in a subshell
    (
        cd "$dest"
        find "$srcs" -depth 1 | while read e; do
            if [[ -e $(basename "$e") ]]; then
                rm -rf "$(basename "$e")"
            fi
            ln -s "$e"
        done
    )

}


if [[ "$SHELL" != *"/zsh" ]]; then
    # TODO: Make sure zsh is available on the system
    chsh zsh
fi

if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

linkto "$thisdir/homedir" "$HOME"
linkto "$thisdir/submodules/omz/plugins" "$HOME/.oh-my-zsh/custom/plugins"
linkto "$thisdir/submodules/omz/themes" "$HOME/.oh-my-zsh/custom/themes"
