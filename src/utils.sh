
function read_user() {
    read -p "${1} (Y/n) " answer
    if [[ -z "${answer}" ]] || [[ "${answer}" == "Y" ]] || [[ "${answer}" == "y" ]]; then
        return 1
    else
        return 0
    fi
}
