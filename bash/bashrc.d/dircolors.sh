# Le theme dircolors (pour la coloration des sorties)
BASH_DIRCOLORS=~/.dircolors.ansi-dark

if [ -f "$BASH_DIRCOLORS" ]; then
    eval $(dircolors "$BASH_DIRCOLORS")
fi
