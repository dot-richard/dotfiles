##
# Description:
#   Affiche un message de salutation.
#
function hello {
    echo "Hello $USER."
}

##
# Description:
#   Crochet lorsqu'une commande est non trouvées.
#
function command_not_found_handle {
    echo "Commande non trouvées: '$@'."
    return 127
}

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

##
# Description:
#   Compresser une archive.
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

##
# Descritpion
#   Extraire un fichier compressé.
function extract {
    if [ -z "$1" ]; then
        echo "Usage: extract <directory or file>"
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

##
# Description:
#   Crée une sauvegarde compressée d'un fichier ou d'un dossier spécifié,
#   en utilisant le format tar.gz et incluant la date actuelle
#   dans le nom du fichier
function backup {
    if [ -z "$1" ]; then
        echo "Usage: backup <directory or file>"
        return 1
    fi

    if [ ! -e "$1" ]; then
        echo "Error: $1 does not exist."
        return 1
    fi

    tar czf backup-$(date '+%Y%m%d').tar.gz "$1"
}

