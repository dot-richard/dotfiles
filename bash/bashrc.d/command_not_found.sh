##
# Description:
#   Se déclanche lorsqu'une commande est non trouvées.
#
command_not_found_handle() {
    # Désactiver la sensibilité a la casse.
    command=$(echo "$1" | tr '[:upper:]' '[:lower:]')
    shift

    # Vérifier si la commande existe dans le PATH
    if command -v "$command" > /dev/null 2>&1; then
        "$command" "$@"
    else
        echo "Commande non trouvée: '$command'."
    fi
}

