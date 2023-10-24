# Définit le répertoire de base
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# Inclut les fonctions utilitaires
source "$BASE_DIR/src/utils.sh"

# Fonction pour ajouter des alias afin de mettre à jour Arch Linux avec pacman, yay, et flatpak
function add_alias_u() {
    local file=$1
    local alias_update
    local alias_clean

    # Configuration des alias en fonction de l'outil AUR choisi
    if [[ "$AUR_HELPER" == "yay" ]]; then
        alias_update="alias update-arch='yay -Syyu && flatpak update'"
        alias_clean="alias clean-arch='yay -Sc && yay -Yc && flatpak remove --unused'"
    elif [[ "$AUR_HELPER" == "paru" ]]; then
        alias_update="alias update-arch='paru -Syyu && flatpak update'"
        alias_clean="alias clean-arch='paru -Sc && paru -c && flatpak remove --unused'"
    fi

    # Alias pour résoudre les problèmes de clé sur Arch Linux
    local alias_key="alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring'"

    # Vérifie si le fichier existe et si l'alias n'est pas déjà présent
    if [[ -f "${file}" ]]; then
        local alias_found=$(cat "${file}" | grep "${alias_update}")
        if [[ -z "${alias_found}" ]]; then
            echo "${alias_update}" >> "${file}"
            echo "${alias_clean}" >> "${file}"
            echo "${alias_key}" >> "${file}"
        fi
    # Si le fichier n'existe pas, créez-le et ajoutez l'alias
    else
        echo "${alias_update}" >> "${file}"
        echo "${alias_clean}" >> "${file}"
        echo "${alias_key}" >> "${file}"
    fi
}

# Fonction pour détecter le shell en cours d'utilisation et le configurer
function chose_shell() {
    echo "Détection de fish..."
    # Vérifie si le shell actuel est fish
    if ! echo "${SHELL}" | grep fish &> /dev/null; then
        # Demande à l'utilisateur s'il souhaite utiliser fish comme terminal
        if read_user "Voulez-vous utiliser fish comme terminal ?"; then
            # Configure fish comme shell par défaut
            echo "Configuration du shell."
            echo "|- Installation de fish."
            sudo pacman -S --noconfirm fish man-db man-pages >> /dev/null 2>&1
            echo "|- Changement du shell par défaut."
            chsh -s /usr/bin/fish
            fish -c "fish_update_completions" >> /dev/null 2>&1
            echo "|- Ajout des alias update-arch, clean-arch et fix-key."
            add_alias_u "${HOME}/.config/fish/config.fish"
            fish -c "set -U fish_greeting" >> /dev/null 2>&1
        else
            # Ajoute les alias au fichier .bashrc si l'utilisateur n'opte pas pour fish
            add_alias_u "${HOME}/.bashrc"
        fi
    fi
    echo "--------------------------------------------------"
}
