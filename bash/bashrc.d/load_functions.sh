# load all bash functions
for file in ./functions/*.sh; do
    if [ -f "$file" ]; then
        echo "load functions $file"
        source "$file"
    fi
done

