
# Prompts the user with a message and waits for a yes or no answer.
# Returns 0 if the user answered yes, 1 otherwise.
# Usage: read_user "Are you sure you want to continue ?"
function read_user() {
    read -p "${1} (y/N) " answer
    if [ "$answer" = "Y" ] || [ "$answer" = "y" ]; then
        return 0
    else
        return 1
    fi
}
