
function read_user() {
    read -p "${1} (y/N) " answer
    if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
        return 0
    else
        return 1
    fi
}
