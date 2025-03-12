#!/bin/bash

# Variables
CLIENT_IP="192.168.56.20"
SERVER_IP="192.168.56.10"
USER="vagrant"

# Génération de la clé SSH sur le client
ssh -i ~/.vagrant.d/insecure_private_key $USER@$CLIENT_IP "ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''"

# Récupération de la clé publique du client
ssh -i ~/.vagrant.d/insecure_private_key $USER@$CLIENT_IP "cat ~/.ssh/id_rsa.pub" > client_id_rsa.pub

# Ajout de la clé publique dans le authorized_keys du serveur
ssh -i ~/.vagrant.d/insecure_private_key $USER@$SERVER_IP "mkdir -p ~/.ssh && chmod 700 ~/.ssh && cat >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys" < client_id_rsa.pub


echo "Clé ajoutée, le client peut maintenant se connecter au serveur avec : ssh vagrant@$SERVER_IP"

