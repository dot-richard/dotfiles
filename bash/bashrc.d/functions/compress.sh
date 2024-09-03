##
# Description:
#   Compresser une archive.
#
# Usage:
#   name <FILE or DIRECTORY>
#
function compress {
    if [ -z "$1" ]; then
        echo "Usage: compress <directory or file>"
        return 1
    fi

    if [ -f "$1" ]; then
        case "$1" in
            *.tar)       tar cvf "$1.tar" "$1" ;;
            *.tar.bz2)   tar cvjf "$1.tar.bz2" "$1" ;;
            *.tar.gz)    tar cvzf "$1.tar.gz" "$1" ;;
            *.bz2)       bzip2 "$1" ;;
            *.gz)        gzip "$1" ;;
            *.zip)       zip -r "$1.zip" "$1" ;;
            *.7z)        7z a "$1.7z" "$1" ;;
            *)           echo "Format non reconnu : $1" ;;
        esac
    else
        echo "$1 n'est pas un fichier valide." >&2
        return 1
    fi
}

