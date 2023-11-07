function header() {
    clear
    cat <<-EOF
-----------------------------------------------------------------------------------------------------------

       ${PURPLE}%%%%%%%%%%${RESET}  ${GREEN}*********${RESET}            
       ${PURPLE}%%%${RESET}                 ${GREEN}******${RESET}       
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      Script Architect for Arch Linux
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      GitHub : https://github.com/Cardiacman13/Architect
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET} 
        ${PURPLE}%%%%%%${RESET}                 ${GREEN}***${RESET} 
             ${PURPLE}%%%%%%%%${RESET}  ${GREEN}***********${RESET}     

-----------------------------------------------------------------------------------------------------------
EOF

    sleep 1
    printf "%b" "${RED}This script will make changes to your system.${RESET}\n"
    printf "%b" "Some steps may take longer, depending on your Internet connection and CPU.\nPress ${GREEN}Entrer${RESET} to continue, or ${GREEN}Ctrl+C${RESET} to cancel."

    read -rp "" choice
    [[ -n $choice ]] && exit 0
}

function init_log() {
    if [[ -f "${LOG_FILE}" ]]; then
        rm -f "${LOG_FILE}"
    fi

    touch "${LOG_FILE}"
    echo -e "Commit hash: $(git rev-parse HEAD)" >>"${LOG_FILE}"
    echo -e "Log file: ${LOGFILE}\n" >>"${LOG_FILE}"
}
