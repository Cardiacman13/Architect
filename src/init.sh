# Display the script header and warning message before execution
function header() {
    clear

    # Display stylized ASCII art with color codes
    cat <<-EOF
-----------------------------------------------------------------------------------------------------------

       ${PURPLE}%%%%%%%%%%${RESET}  ${GREEN}*********${RESET}            
       ${PURPLE}%%%${RESET}                 ${GREEN}******${RESET}       
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      `eval_gettext "Script Architect for Arch Linux"`
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      GitHub : https://github.com/Cardiacman13/Architect/
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET}      
       ${PURPLE}%%%${RESET}                     ${GREEN}***${RESET} 
        ${PURPLE}%%%%%%${RESET}                 ${GREEN}***${RESET} 
             ${PURPLE}%%%%%%%%${RESET}  ${GREEN}***********${RESET}     

-----------------------------------------------------------------------------------------------------------
EOF

    sleep 1

    # Display warning and user prompt
    eval_gettext "\${RED}This script will make changes to your system.\${RESET}"; echo
    eval_gettext "Some steps may take longer, depending on your Internet connection and CPU."; echo
    eval_gettext "Press \${GREEN}Enter\${RESET} to continue, or \${RED}Ctrl+C\${RESET} to cancel."; echo

    # Wait for user confirmation
    read -rp "" choice

    # If the user types something instead of pressing Enter, exit the script
    [[ -n $choice ]] && exit 0
}

# Initialize the log file for the script
function init_log() {
    # Remove the existing log file if it already exists
    if [[ -f "${LOG_FILE}" ]]; then
        rm -f "${LOG_FILE}"
    fi

    # Create a new empty log file
    touch "${LOG_FILE}"

    # Log the current Git commit hash and log file path for reference
    echo -e "Commit hash: $(git rev-parse HEAD)" >>"${LOG_FILE}"
    echo -e "Log file: ${LOG_FILE}\n" >>"${LOG_FILE}"
}
