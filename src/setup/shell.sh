BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$BASE_DIR/src/utils.sh"

function add_alias_u() {
    local file=$1
    local alias="alias update-arch='sudo pacman -Scc && sudo pacman -Syy && yay -S archlinux-keyring && yay && yay -Sc && sudo pacman -Rns \$(pacman -Qdtq) && flatpak update'"

    if [[ -f "${file}" ]]; then
        local alias_found=$(cat "${file}" | grep "${alias}")
        if [[ -z "${alias_found}" ]]; then
            sudo echo "${alias}" >> "${file}"
        fi
    else
        sudo echo "${alias}" >> "${file}"
    fi
}

function chose_shell() {
    if ! echo "${SHELL}" | grep fish &> /dev/null; then
        if read_user "Voulez vous utiliser fish comme terminal ?"; then
            echo "Configuration du shell"
            echo "|- Installation de fish"
            sudo pacman -S --noconfirm fish man-db man-pages >> /dev/null 2>&1
            echo "|- Changement du shell par défaut"
            chsh -s /usr/bin/fish
            fish -c "fish_update_completions" >> /dev/null 2>&1
            echo "|- Ajout de l'alias update-arch"
            add_alias_u "${HOME}/.config/fish/config.fish"
            fish -c "set -U fish_greeting" >> /dev/null 2>&1
        else
            add_alias_u "${HOME}/.bashrc"
        fi
    fi
    echo "--------------------------------------------------"
}
