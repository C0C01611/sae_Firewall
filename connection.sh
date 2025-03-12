#!/bin/bash

# Vérification de l'argument
if [ -z "$1" ]; then
  echo "Usage: $0 {server|client|setup-ssh}"
  exit 1
fi

USER="vagrant"

case $1 in
  server)
    echo "Connexion SSH au serveur..."
    (cd server && vagrant ssh)
    ;;
  
  client)
    echo "Connexion SSH au client..."
    (cd client && vagrant ssh)
    ;;
  
  setup-ssh)
    echo "Configuration de la connexion SSH client -> serveur..."

    # 1. Vérification et génération de la clé SSH sur le client
    echo "Vérification de la présence de la clé SSH sur le client..."
    (cd client && vagrant ssh -c "test -f ~/.ssh/id_rsa || ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''")

    # 2. Récupération de la clé publique depuis la machine client
    echo "Récupération de la clé publique du client..."
    CLIENT_PUB_KEY=$(cd client && vagrant ssh -c "cat ~/.ssh/id_rsa.pub")

    # Vérification de la clé publique
    if [ -z "$CLIENT_PUB_KEY" ]; then
      echo "Erreur : Impossible de récupérer la clé publique du client."
      exit 1
    fi

    # 3. Ajout de la clé publique sur le serveur
    echo "Ajout de la clé publique du client sur le serveur..."
    (cd server && vagrant ssh -c "mkdir -p ~/.ssh && echo '$CLIENT_PUB_KEY' >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys")

    # 4. Vérification des permissions sur le serveur
    echo "Vérification des permissions sur le serveur..."
    (cd server && vagrant ssh -c "chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys")

    # 5. Redémarrage du service SSH sur le serveur pour appliquer les changements
    echo "Redémarrage du service SSH sur le serveur..."
    (cd server && vagrant ssh -c "sudo systemctl restart sshd")

    echo "Clé SSH ajoutée avec succès !"
    echo "Tu peux maintenant te connecter au serveur avec :"
    echo "ssh vagrant@192.168.56.10"
    ;;
  
  *)
    echo "Usage: $0 {server|client|setup-ssh}"
    exit 1
    ;;
esac

