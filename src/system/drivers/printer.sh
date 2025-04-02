# Load shared functions
source src/cmd.sh

################################################################################
# Printer-related installations (CUPS, drivers, etc.)
################################################################################
function printer() {
    if ask_question "$(eval_gettext "Do you want to use a printer?")"; then
        local inlst="
            ghostscript
            gsfonts
            cups
            cups-filters
            cups-pdf
            system-config-printer
            avahi
            foomatic-db-engine
            foomatic-db
            foomatic-db-ppds
            foomatic-db-nonfree
            foomatic-db-nonfree-ppds
            gutenprint
            foomatic-db-gutenprint-ppds
        "

        if ask_question "$(eval_gettext "Do you want to use an EPSON printer?")"; then
            inlst+="
                epson-inkjet-printer-escpr
                epson-inkjet-printer-escpr2
            "
        fi

        if ask_question "$(eval_gettext "Do you want to use a HP printer?")"; then
            inlst+="
                hplip
                python-pyqt5
            "
        fi

        # Install all the listed printer-related packages
        install_lst "${inlst}"

        # Enable necessary services
        exec_log "sudo systemctl enable avahi-daemon" "$(eval_gettext "Enabling avahi-daemon service")"
        exec_log "sudo systemctl enable cups" "$(eval_gettext "Enabling cups service")"

        # If firewalld is installed, open the ports/services needed for CUPS
        if command -v firewall-cmd >/dev/null 2>&1; then
            # Open the IPP service (port 631) for network printing
            exec_log "sudo firewall-cmd --permanent --add-service=ipp" "Opening IPP service for CUPS"
            # Enable local printer discovery via mDNS
            exec_log "sudo firewall-cmd --permanent --add-service=mdns" "Opening mDNS for printer discovery"

            exec_log "sudo firewall-cmd --reload" "Reloading firewalld configuration"
        fi
    fi
}
