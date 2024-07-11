# Le chemin vers le fichier d'historique.
HISTFILE="$HOME/.bash_history"

# Le nombre de commande en mémoire (commande history).
HISTSIZE=1000

# Le nombre de commande dans le fichier d'historique.
HISTFILESIZE=2000

# Ignore des commandes.
HISTIGNORE='&:l[als]*:cd*:clr:clear'
# Format du temps
# Un exemple de retour :
# history
#   746  14/08/2018 21:43:14 cd
#   747  14/08/2018 21:43:15 ls
#HISTTIMEFORMAT='%F %T'
HISTTIMEFORMAT="%d/%m/%Y %H:%M:%S "

# Meilleurs controles de l'historique
# Ne pas enregistrer les commandes qui commencent par un espace
#HISTCONTROL="ignorespace"
# Ne pas afficher les commandes dupliquées qui se suivent
#HISTCONTROL="ignoredups"
# A le même effet que les deux commandes précédente
#HISTCONTROL="ignoreboth"
# Supprime toutes les commandes dupliquées (même celles qui ne se suivent pas)
#HISTCONTROL="erasedups"
# Efface les commandes dupliquées, n'enregistre pas les commandes qui commencent par un espace
HISTCONTROL="erasedups:ignorespace"

# Ajoute l'historique actif au fichier plutôt que l'écraser.
shopt -s histappend

# Ajouter history -a lors d'une saisie de commande.
PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND; }history -a"

# Enregistrer les commandes multi-lignes en une ligne dans l'historique.
shopt -s cmdhist

# Naviguer dans l'historique :
bind '"\e[A": history-search-backward'  # fleche haut
bind '"\e[B": history-search-forward'   # fleche bas

# Navigation automatique en tapant le nom d'un répertoire sans 'cd'.
shopt -s autocd

# Corrige les erreurs de frappe dans 'cd'.
shopt -s cdspell

# Corrige les erreurs de frappe lors de la complétions.
shopt -s dirspell

