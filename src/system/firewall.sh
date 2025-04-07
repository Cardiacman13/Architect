# Load shared functions
source src/cmd.sh

# The firewall function prompts the user to install a firewall (Firewalld or UFW).
# then lets the user choose between Firewalld and UFW.

function firewall() {
    # Ask the user to install a firewall
    if ask_question "$(eval_gettext "Do you want to install a firewall /!\\ Install and activate firewalld? The default configuration may block access to printers and other devices on your local network ?")"; then
        
        # Prompt the user to choose which firewall to install.
        echo "Which firewall do you want to install?"
        
        # The select statement presents a simple interactive menu:
        select firewall_choice in "Firewalld" "UFW"; do
            case $firewall_choice in
                
                # If the user selects "Firewalld"
                "Firewalld")
                    # Install the necessary packages: firewalld, python-pyqt5, and python-capng
                    install_lst "firewalld python-pyqt5 python-capng"
                    
                    # Enable and start the firewalld service immediately
                    sudo systemctl enable --now firewalld.service &> /dev/null
                    
                    # Remove SSH and DHCPv6-Client services from the default firewall zone (optional)
                    sudo firewall-cmd --remove-service="ssh" --permanent &> /dev/null
                    sudo firewall-cmd --remove-service="dhcpv6-client" --permanent &> /dev/null
                    
                    # Inform the user that Firewalld is set up
                    echo "Firewalld has been installed and enabled."
                    break
                    ;;
                
                # If the user selects "UFW"
                "UFW")
                    # Install the UFW package
                    install_lst "ufw"
                    
                    # Enable and start the ufw service
                    sudo systemctl enable --now ufw.service &> /dev/null
                    
                    # Activate ufw (by default, it may block all incoming connections except SSH)
                    sudo ufw enable
                    
                    # Inform the user that UFW is set up
                    echo "UFW has been installed and enabled."
                    break
                    ;;
                
                # Any invalid choice leads to a prompt to select again
                *)
                    echo "Invalid choice, please select 'Firewalld' or 'UFW'."
                    ;;
            esac
        done
    fi
}
