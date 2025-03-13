#!/bin/bash

# Vérification de l'argument
if [ -z "$1" ]; then
  echo "Usage: $0 {server|client}"
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
  *)
    echo "Usage: $0 {server|client}"
    exit 1
    ;;
esac

