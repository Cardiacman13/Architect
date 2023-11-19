function endscript() {
    local -r end_time="$(date +%s)"
    local -r duration="$((${end_time} - ${1}))"

    echo -e "Done in ${GREEN}${duration}${RESET} seconds."
    echo -e "Done in ${duration} seconds." >>"${LOG_FILE}"

    read -rp "Do you want to upload the log file to a pastebin? (y/N) " response
    response=${response,,}

    if [[ "$response" =~ ^(yes|y)$ ]]; then
        echo -e "Uploading log file to pastebin..."
        local -r url="$(curl -s -F 'file=@'"${LOG_FILE}" https://0x0.st)"
        echo -e "Log file uploaded to ${url}"
    fi

    read -rp "${GREEN}Script completed successfully, the system must restart${RESET}: Press ${GREEN}Enter${RESET} to restart or ${RED}Ctrl+C${RESET} to cancel."
    for i in {5..1}; do
        echo -ne "${GREEN}Restarting in ${i} seconds...${RESET}\r"
        sleep 1
    done
    reboot
}
