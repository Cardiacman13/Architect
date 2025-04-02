# Load shared functions
source src/cmd.sh

# Add the current user to common system groups for hardware and peripheral access
function add_groups_to_user() {
    local -r groups_lst="sys,network,wheel,audio,lp,storage,video,users,rfkill"
    exec_log "sudo usermod -aG ${groups_lst} $(whoami)" "$(eval_gettext "Adding user to groups: ${groups_lst}")"
}
