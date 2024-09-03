##
# Description:
#   Crée une sauvegarde compressée d'un fichier ou d'un dossier spécifié,
#   en utilisant le format tar.gz et incluant la date actuelle
#   dans le nom du fichier
#
# Usage:
#   name <FILE or DIRECTORY>
#
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

