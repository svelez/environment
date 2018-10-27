#!/usr/bin/env bash

set -eo pipefail
ENVROOT="$(cd "$(dirname "$0")" && pwd)"

source "$ENVROOT/lib/setuplib.sh"
source "$ENVROOT/lib/osx/setuplib.sh"

if [[ "$SHELL" != *"/zsh" ]]; then
    # TODO: Make sure zsh is available on the system
    chsh zsh
fi

if [[ ! -d ~/.oh-my-zsh ]]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

linkto "$ENVROOT/homedir" "$HOME"
linkto "$ENVROOT/submodules/omz/plugins" "$HOME/.oh-my-zsh/custom/plugins"
linkto "$ENVROOT/submodules/omz/themes" "$HOME/.oh-my-zsh/custom/themes"

linkAppPrefs
