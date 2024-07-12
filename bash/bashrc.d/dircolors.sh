# Le theme dircolors (pour la coloration des sorties)
BASH_DIRCOLORS=~/.dircolors_themes/monokai.dircolors

if [ -f "$BASH_DIRCOLORS" ]; then
    eval $(dircolors "$BASH_DIRCOLORS")
else
    echo "Aucun fichier dircolors trouvé."
fi
