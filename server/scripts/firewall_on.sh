#!/bin/bash

echo "Activation du firewall (UFW)..."

# Réinitialiser UFW
sudo ufw --force reset

# Autoriser HTTP pour tout le monde
sudo ufw allow 80

# Autoriser SSH uniquement depuis le client
sudo ufw allow from 192.168.56.20 to any port 22

# Bloquer SSH depuis l'extérieur (ex: machine externe)
sudo ufw deny from 192.168.56.1 to any port 22

# Empêcher la DMZ (serveur) d'initier des connexions vers le LAN
sudo ufw deny out from 192.168.56.10 to 192.168.56.20

# Activer le firewall
sudo ufw --force enable

# Afficher le statut
echo "Règles UFW actuelles :"
sudo ufw status verbose

