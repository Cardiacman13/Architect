# Function called at the end of the main script
function endscript() {
    # Get the current time (in seconds since epoch)
    local -r end_time="$(date +%s)"

    # Calculate the total duration of the script (end - start)
    local -r duration="$((${end_time} - ${1}))"

    # Display execution time in the terminal
    eval_gettext "Done in \${GREEN}\${duration}\${RESET} seconds."; echo

    # Also write the duration to the log file
    echo -e "Done in ${duration} seconds." >>"${LOG_FILE}"

    # Ask the user if they want to upload the log file to a pastebin (0x0.st)
    if ask_question "$(eval_gettext "Do you want to upload the log file to a pastebin?")"; then
        eval_gettext "Uploading log file to pastebin..."; echo

        # Upload the log and capture the URL
        local -r url="$(curl -s -F 'file=@'"${LOG_FILE}" https://0x0.st)"

        # Display the pastebin URL
        eval_gettext "Log file uploaded to \${url}"; echo
    fi

    # If NOREBOOT is true, skip the reboot and just exit the script
    if [[ "${NOREBOOT}" == "true" ]]; then
        eval_gettext "\${GREEN}Script completed successfully.\${RESET}"; echo
        exit 0
    fi

    # Otherwise, ask the user to confirm system reboot
    read -rp "$(eval_gettext "\${GREEN}Script completed successfully, the system must restart\${RESET}: Press \${GREEN}Enter\${RESET} to restart or \${RED}Ctrl+C\${RESET} to cancel.")"

    # 5-second countdown before rebooting
    for i in {5..1}; do
        eval_gettext "\${GREEN}Restarting in \${i} seconds...\${RESET}"; echo -ne "\r"
        sleep 1
    done

    # Reboot the system
    reboot
}
