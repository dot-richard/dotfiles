# ~/.profile

# Variables d'environnement
export LANG="fr_FR.utf8"
export EDITOR="vim"
export VISUAL="$EDITOR"
export BROWSER="firerox"
export PATH="$HOME/bin:$PATH"

# Permissions restrictives :
# Les nouveaux fichiers auront des permissions 644 (rw-r--r--)
# Les nouveaux répertoires auront des permissions 755 (rwxr-xr-x)
umask 022

# Autres configurations spécifiques.
# Configurations supplémentaires peuvent être ajoutées ici :

export PATH="$PATH:$HOME/.rbenv/bin"
eval "$(rbenv init - $SHELL)"
