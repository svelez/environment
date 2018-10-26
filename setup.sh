#!/usr/bin/env bash

set -eo pipefail
thisdir="$(cd "$(dirname "$0")" && pwd)"

if [[ "$SHELL" != *"/zsh" ]]; then
    # TODO: Make sure zsh is available on the system
    chsh zsh
fi

if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

# TODO: Fetch these oh-my-zsh plugins and themes:
# git@github.com:bhilburn/powerlevel9k.git
# git@github.com:zsh-users/zsh-autosuggestions.git
# git@github.com:zsh-users/zsh-syntax-highlighting.git

find "$thisdir/homedir" -depth 1 | while read e; do
    (
        # Change to a subshell to protect current directory in case of failure
        cd "$HOME"

        if [[ -e $(basename "$e") ]]; then
            rm -rf "$(basename "$e")"
        fi
        ln -s "$e"
    )
done
