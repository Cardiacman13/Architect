function exec_log() {
    if [[ $# -ne 2 ]]; then
        echo "Usage: exec_log <message> <command>"
        exit 1
    fi

    ((EXEC_LOG_COUNT++))

    local -r command="$1"
    local -r comment="$2"

    echo -e "${comment}"
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] ${comment}" >>"${LOG_FILE}"

    if [[ ${VERBOSE} == true ]]; then
        {
            eval "$(command)" 2>&1 1>&3 |
                while read -r line; do
                    ((ERROR_COUNT++))
                    echo -e "${RED}${line}${RESET}"
                done
        } 3>&1 1>&2 | tee -a "${LOG_FILE}"
    else
        eval "$(command)" >>"${LOG_FILE}" 2>&1 >/dev/null
    fi
}
