#!/bin/bash

# Vérification que les arguments sont présents
if [ -z "$1" ]; then
  echo "Usage: $0 {setup-ssh}"
  exit 1
fi

USER="vagrant"
CLIENT_IP="192.168.56.20"
SERVER_IP="192.168.56.10"

case $1 in
  setup-ssh)
    echo "Configuration de la clé SSH du client vers le serveur..."

    # Étape 1: Générer la clé SSH sur la machine client si elle n'existe pas déjà
    echo "Vérification de la présence de la clé SSH sur la machine client..."
    (cd client && vagrant ssh -c "test -f ~/.ssh/id_rsa || ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''")

    # Étape 2: Récupérer la clé publique du client
    echo "Récupération de la clé publique depuis la machine client..."
    CLIENT_PUB_KEY=$(cd client && vagrant ssh -c "cat ~/.ssh/id_rsa.pub")

    if [ -z "$CLIENT_PUB_KEY" ]; then
      echo "Erreur : Impossible de récupérer la clé publique du client."
      exit 1
    fi

    # Étape 3: Ajouter la clé publique dans le fichier authorized_keys sur le serveur
    echo "Ajout de la clé publique du client sur le serveur..."
    (cd server && vagrant ssh -c "mkdir -p ~/.ssh && echo '$CLIENT_PUB_KEY' >> ~/.ssh/authorized_keys && chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys")

    # Étape 4: Vérifier et corriger les permissions sur le serveur
    echo "Vérification et correction des permissions sur le serveur..."
    (cd server && vagrant ssh -c "chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys")

    # Étape 5: Redémarrer le service SSH sur le serveur
    echo "Redémarrage du service SSH sur le serveur..."
    (cd server && vagrant ssh -c "sudo systemctl restart sshd")

    echo "✅ La clé SSH du client a été ajoutée avec succès au serveur."
    echo "Vous pouvez maintenant vous connecter du client vers le serveur avec :"
    echo "ssh vagrant@192.168.56.10"
    ;;
  *)
    echo "Usage: $0 {setup-ssh}"
    exit 1
    ;;
esac

