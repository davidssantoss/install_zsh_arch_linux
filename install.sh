#!/bin/bash

#        DO NOT RUN ON ROOT USER !!!
# ¡¡¡    No ejecutar el script con el usuario root !!!

############################################
# Installation and customization of zsh in Arch Linux
# Instalacion y personalizacion de zsh en Arch Linux
# @author: devsantos
############################################


# Variables
uid=$(id -u)
uidn=$(id -u -n)

preventroot() {
    if [[ $uid -eq 0 ]]; then
        ans="Y"
        echo "Run this script as root may be insecure. Continue? [Y/n]"
        read ans
        if [ $ans -ne "Y" ]; then
            exit 0
        fi
    fi
}

# Customizing zsh

install_ohmyzsh() {
    clear
    cd ~
    mkdir ohmyzsh-git && cd ohmyzsh-git
    git clone https://github.com/ohmyzsh/ohmyzsh.git
    cd ohmyzsh/tools
    sed -i "s/exec.*/#exec zsh -l/" install.sh
    sh install.sh
}
install_powerlevel10k() {    
    git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
    sed -i 's@^ZSH_THEME=.*$@ZSH_THEME="powerlevel10k/powerlevel10k"@g' ~/.zshrc            
}
customize() {
    clear
    read -n 1 -p "Would you like to add customizations in zsh rigth now? :>[Y/n] " ans 
    case $ans in
        Y*|y*|S*|s*|'')
            clear
            echo -e "\t ***Install customization***"
            echo -e "\n* Do you want to install oh-my-zsh? Type 1"
            echo -e "* Do you want to install oh-my-zsh with theme powerlevel10k? Type 2"
            echo -e "* By default will install oh-my-zsh"
            echo -e "* Do not customizate! Type 0\n\n"
            read -n 1 -p "Choose your option [1,2,0]:> " option
            case $option  in
                1)
                    install_ohmyzsh
                    echo "Done!"
                    ;;
                2)
         	    	install_ohmyzsh
                    install_powerlevel10k
                    echo "Done!"
                    ;;
                0)
         	    	echo -e "\nNot customized\n"
                    # Change shell to zsh
                    # Cambiar de shell a zsh
                    chsh -s $(which zsh)
                    ;;
                "")
                    install_ohmyzsh
                    ;;
                *) ;;
            esac
            ;;
        N*|n*)
            chsh -s $(which zsh)
            ;;
        *)
            true
            ;;
    esac
}
coninfo() {
    clear
    cat <<'EOF'
        Well done! you have installed zsh
        Thanks for using the script. Hope it helps you!

        Contact me: davsantos@pm.me
        * Github: github.com/devsantos
EOF
}

applychanges() {
    echo -e "\nNow you should logout"

    # Log out session to apply changes 
    # Terminando la sesión para aplicar cambios de la shell

    if [[ $uid -ne 0 ]]; then
        read -n 1 -p 'This will kill your user session, proceed?[Y/n]:> ' answer
        case $ans in
            Y*|y*|S*|s*|'')
                echo -e "\nlog out..."
                sleep 5
                sudo pkill -9 -u $uidn
                ;;
            N*|n*)
                exec zsh -l
                ;;
            *) ;;
        esac
    else
        exit 0
    fi
}

main() {
    echo "Preparing the installation..."

    if [[ -f /etc/os-release || -f /usr/lib/os-release ]]; then
        # Source the os-release file
        for file in /etc/os-release /usr/lib/os-release; do
            source "$file" && echo $file && break
        done
        distro="${NAME:-${DISTRIB_ID}}"
        distroName=${distro,,}
        case $distroName in 
            'arch linux'|'manjaro'|'endeavouros')                
                #Update, Download and upgrade packages also install zsh and git
                #Actualizar, descargar e instalar paquetes tambien instalar zsh y git
                sudo pacman -Syu --needed sed zsh git 
                customize
                coninfo
                applychanges
                ;;
            'debian'|'ubuntu'|'linux mint'|'parrot os'|'kali linux'|'mx linux'|'deepin'|'devuan'|'pureos'|'tails')
                sudo apt update && sudo apt install zsh
                customize
                coninfo
                applychanges
                ;;
            *) ;;
        esac
    fi
}

preventroot
 cat << 'EOF'

       _           _   _              _     
      (_) __ _ ___| |_(_) ___ _______| |__  
      | |/ _` / __| __| |/ __|_  / __| '_ \ 
      | | (_| \__ \ |_| | (__ / /\__ \ | | |
     _/ |\__,_|___/\__|_|\___/___|___/_| |_|
    |__/                                    
    ... just another script to install and customizate zsh

EOF
main 