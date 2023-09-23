
function read_user() {
    read -p "${1} (Y/n) " answer
    if [ "$answer" = "Y" ] || [ "$answer" = "y" ] || [ "$answer" = "" ]; then
        return 0
    else
        return 1
    fi
}
