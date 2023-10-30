
function endscript() {
    local -r end_time="$(date +%s)"
    local -r duration="$(($end_time - $start_time))"

    echo -e "${GREEN}Done in ${duration} seconds.${RESET}" | tee -a "${LOG_FILE}"
    echo -e "${GREEN}Executed ${EXEC_LOG_COUNT} commands.${RESET}" | tee -a "${LOG_FILE}"
    echo -e "${RED}Found ${ERROR_COUNT} errors.${RESET}" | tee -a "${LOG_FILE}"

    # ask if he want to put the log file on a pastebin
    read -rp "${GREEN}Do you want to upload the log file to a pastebin?${RESET} (y/N) " response
    response=${response,,}
    if [[ "$response" =~ ^(yes|y)$ ]]; then
        echo -e "${GREEN}Uploading log file to pastebin...${RESET}"
        local -r url="$(curl -s -F 'file=@'"${LOG_FILE}" https://0x0.st)"
        echo -e "${GREEN}Log file uploaded to ${url}${RESET}"
    fi

    read -rp "${GREEN}The script is finished, the system must restart${RESET}: Press ${GREEN}Enter${RESET} to restart or ${GREEN}Ctrl+C${RESET} to cancel."
    for i in {5..1}; do
        echo -ne "${GREEN}Restarting in ${i} seconds...${RESET}\r"
        sleep 1
    done
    reboot
}