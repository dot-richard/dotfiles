##
# Description:
#   Naviguer dans un repertoire et lister son contenu.
#
function cdl {
    if [ -z "$1" ]; then
        echo "Usage: cdl <directory>"
        return 1
    fi

    cd "$1" && ls
}

