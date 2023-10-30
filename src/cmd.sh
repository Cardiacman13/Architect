function exec_log() {
    if [[ $# -ne 2 ]]; then
        echo -e "${RED}Usage: exec_log <command> <message>${RESET}"
        exit 1
    fi

    ((EXEC_LOG_COUNT++))

    local -r command="$1"
    local -r comment="$2"

    echo -e "${comment}"
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] ${comment}" >> ${LOG_FILE}
    echo "${command}" >> ${LOG_FILE}

    if [[ ${VERBOSE} == true ]]; then
        eval "${command}" |& tee -a ${LOG_FILE}
    else
        eval "${command}" >> ${LOG_FILE} 2>&1
    fi
}