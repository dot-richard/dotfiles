##
# DESCRIPTION:
#   Trouve les identifiants des process par leur nom.
#
# USAGE:
#   name <PROC_NAME>

function find_procids {

    if [ -z "$1" ]; then
        echo "Usage: find_proc <PROC_NAME>"
        exit 1
    fi

    pidof "$1"
}

