# Fonction de redémarrage avec un compte à rebours
function reboot_timer() {
    local timer=$1

    echo -e "${GREEN}Le script est terminé, le système doit redémarrer${RESET} : Appuyez sur ${GREEN}Entrée${RESET} pour redémarrer ou ${GREEN}Ctrl+C${RESET} pour annuler."
    read -p "" choice
    if [[ "${choice}" == "" ]]; then
        while [[ ${timer} -gt 0 ]]; do
            echo -e "${GREEN}Redémarrage dans ${timer} secondes...${RESET}"
            sleep 1
            ((timer--))
        done
    fi
    sudo reboot
}
