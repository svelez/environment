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

# A place-holder command
function noop() {
    echo . > /dev/null
}

function linkAppPrefs() {
    noop
}


