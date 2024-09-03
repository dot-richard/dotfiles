##
# Descritpion:
#   Extraire un fichier compressé.
#
# Usage:
#   name <FILE or DIRECTORY>
#
function extract {
    if [ -z "$1" ]; then
        echo "Usage: name <directory or file>"
        return 1
    fi

    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xvjf "$1" ;;
            *.tar.gz)    tar xvzf "$1" ;;
            *.bz2)       bunzip2 "$1" ;;
            *.rar)       unrar x "$1" ;;
            *.gz)        gunzip "$1" ;;
            *.tar)       tar xvf "$1" ;;
            *.tbz2)      tar xvjf "$1" ;;
            *.tgz)       tar xvzf "$1" ;;
            *.zip)       unzip "$1" ;;
            *.Z)         uncompress "$1" ;;
            *.7z)        7z x "$1" ;;
            *)           echo "Format non reconnu : $1" ;;
        esac
    else
        echo "$1 n'est pas un fichier valide." >&2
        return 1
    fi
}

