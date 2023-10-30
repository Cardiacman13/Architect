
function header() {
    clear
    cat <<- EOF
-----------------------------------------------------------------------------------------------------------

       ${PURPLE}%%%%%%%%%%${RESET}  ${GREEN}*********${RESET}            
       ${PURPLE}%%%${RESET}                 ${GREEN}******${RESET}       
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      Script Architect for Arch Linux
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      GitHub : https://github.com/Cardiacman13/Tuto-Arch
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      Par https://github.com/Cardiacman13
        ${PURPLE}%%%%%%${RESET}                 ${GREEN}***${RESET}       et https://github.com/wmemcpy
             ${PURPLE}%%%%%%%%${RESET}  ${GREEN}***********${RESET}     

-----------------------------------------------------------------------------------------------------------
EOF

    sleep 1
    printf "%b" "${RED}This script will make changes to your system.${RESET}\n"
    printf "%b" "Some steps may take longer, depending on your Internet connection and CPU.\nPress ${GREEN}Entrée${RESET} to continue, or ${GREEN}Ctrl+C${RESET} to cancel.\n"
    
    read -r -p "" choice
    [[ -n $choice ]] && exit 0
}

function init_log() {
    if [ ! -d $log_file_name ]; then
        touch $log_file_name
    fi

    echo "[$(date "+%Y-%m-%d %H:%M:%S")] $1" >> $log_file_name
}
