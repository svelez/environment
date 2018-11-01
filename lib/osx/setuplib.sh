
function linkAppPrefs() {
    linkto "$ENVROOT/platforms/osx/Preferences" "$HOME/Library/Preferences"
}

function initializePkgMgr() {
    if ! has brew; then
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
        brew update
    fi
}

function osxBrewPkgInstaller() {
    local pkgid=$1
    local mgrid=$2

    local cmd=(brew)
    if [[ cask == $mgrid ]]; then
        cmd+=(cask)
    fi

    echo "Checking for need to instal $pkgid" >&2
    if ! "${cmd[@]}" ls --versions $pkgid &> /dev/null ; then
        "${cmd[@]}" install $pkgid
    fi
}

function installHelperArgs() {
    echo "(brew|cask)" osxBrewPkgInstaller
}
