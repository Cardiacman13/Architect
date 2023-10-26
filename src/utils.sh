function read_user() {
    read -p "${1} [y/N]: " choice
    case "${choice}" in
        y|Y ) return 0;;
        * ) return 1;;
    esac
}
