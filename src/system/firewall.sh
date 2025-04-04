# Load shared functions
source src/cmd.sh

# Prompt user to install and activate Firewalld
function firewall() {
    if ask_question "$(eval_gettext "Do you want to install a firewall /!\\ Install and activate firewalld? The default configuration may block access to printers and other devices on your local network ?")"; then
        install_lst "firewalld python-pyqt5 python-capng"
        sudo systemctl enable --now firewalld.service &> /dev/null
        sudo firewall-cmd --remove-service="ssh" --permanent &> /dev/null
        sudo firewall-cmd --remove-service="dhcpv6-client" --permanent &> /dev/null
    fi
}
