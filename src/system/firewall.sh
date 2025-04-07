# Load shared functions
source src/cmd.sh

function firewall() {
    # We keep the question exactly as requested
    if ask_question "$(eval_gettext "Do you want to install a firewall /!\\ Install and activate firewalld? The default configuration may block access to printers and other devices on your local network ?")"; then
        echo "Which firewall do you want to install?"
        select firewall_choice in "Firewalld" "UFW"; do
            case $firewall_choice in
                "Firewalld")
                    install_lst "firewalld python-pyqt5 python-capng"
                    sudo systemctl enable --now firewalld.service &> /dev/null
                    sudo firewall-cmd --remove-service="ssh" --permanent &> /dev/null
                    sudo firewall-cmd --remove-service="dhcpv6-client" --permanent &> /dev/null
                    echo "Firewalld has been installed and enabled."
                    break
                    ;;
                "UFW")
                    install_lst "ufw"
                    sudo systemctl enable --now ufw.service &> /dev/null
                    sudo ufw enable
                    echo "UFW has been installed and enabled."
                    break
                    ;;
                *)
                    echo "Invalid choice, please select 'Firewalld' or 'UFW'."
                    ;;
            esac
        done
    fi
}
