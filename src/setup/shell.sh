BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/utils.sh"

function add_alias_u() {
    local FILE=$1
    local ALIAS="alias update-arch='sudo pacman -Scc && sudo pacman -Syy && yay -S archlinux-keyring && yay && yay -Sc && sudo pacman -Rns \$(pacman -Qdtq) && flatpak update'"

    if [[ -f "${FILE}" ]]; then
        local ALIAS_FOUND=$(cat "${FILE}" | grep "${ALIAS}")
        if [[ -z "${ALIAS_FOUND}" ]]; then
            sudo echo "${ALIAS}" >> "${FILE}"
        fi
    else
        sudo echo "${ALIAS}" >> "${FILE}"
    fi
}

function chose_shell() {
    if ! echo "${SHELL}" | grep fish &> /dev/null; then
        if read_user "Voulez vous utiliser fish comme terminal ?"; then
            sudo pacman -S --noconfirm fish man-db man-pages
            chsh -s /usr/bin/fish
            fish -c "fish_update_completions"
            add_alias_u "${HOME}/.config/fish/config.fish"            
            fish -c "set -U fish_greeting"
        else
            add_alias_u "${HOME}/.bashrc"
        fi
    fi
}
