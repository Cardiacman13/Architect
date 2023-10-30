
function exec_log() {
    if [[ $# -ne 3 ]]; then
        echo "Usage: exec_log <message> <command>"
        exit 1
    fi

    ((EXEC_LOG_COUNT++))

    local -r indent_level="$1"
    local -r command="$2"
    local -r comment="$3"

    echo -e "${comment}"
    echo "[$(date "+%Y-%m-%d %H:%M:%S")] ${comment}" >>"${LOG_FILE}"

    if [[ ${VERBOSE} == true ]]; then
        # print command output with the error output in red, and put in to log file
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