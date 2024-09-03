##
# Description:
#   Creer les repertoires en chaine et pointe immediatement dedans.
#
function mkcd {
    if [ -z "$1" ]; then
        echo "Usage: mkcd <directory>"
        return 1
    fi

    mkdir -p "$1" && cd "$1"
}

