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

# normalize a dotted-component version number for string comaprison
function version() {
    echo "$1" | awk -F. '{printf("%04d.%04d.%04d.%04d\n", $1, $2, $3, $4)}'
}

# check to see if a command is available on the path
function has() {
    which "$1" >& /dev/null
}

