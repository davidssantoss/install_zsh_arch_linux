#!/bin/bash

# ¡¡¡ DO NOT RUN ON ROOT USER !!!

############################################
# Installation of zsh in Arch Linux
# Instalacion de zsh en Arch Linux
# @author: devsantos
############################################


# Variables
uid=$(id -u)
uidn=$(id -u -n)

if [[ $uid -eq 0 ]]; then
    exit 0
fi


#Update, Download and upgrade packages
#Actualizar, descargar e instalar paquetes
sudo pacman -Syu 

echo "Preparing the installation..."
# Install zsh 
# Instalar zsh
sudo pacman -S zsh

# Change shell to zsh
# Cambiar de shell a zsh
chsh -s $(which zsh)

# Log out session to apply changes 
# Terminando la sesión para aplicar cambios de la shell

if [[ $uid -ne 0 ]]; then
    read -n 1 -p 'This will kill your user session, proceed?[Y/n]:> ' answer
    if [[ $answer == 'Y' || $answer == 'y' || $answer == 'S' || $answer == 's' || $answer == '' ]]; then
        echo -e "\nlog out..."
        sleep 5
        sudo pkill -9 -u $uidn
    else
        exit 0
    fi
else
    exit 0
fi