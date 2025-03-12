#!/bin/bash

# Vérification de l'argument
if [ -z "$1" ]; then
  echo "Usage: $0 {up|halt|destroy|reload}"
  exit 1
fi

# Actions en fonction du premier argument
case $1 in
  up)
    echo "Démarrage des machines..."
    (cd server && vagrant up)
    (cd client && vagrant up)
    ;;
  halt)
    echo "Arrêt des machines..."
    (cd server && vagrant halt)
    (cd client && vagrant halt)
    ;;
  destroy)
    echo "Destruction des machines..."
    (cd server && vagrant destroy -f)
    (cd client && vagrant destroy -f)
    ;;
  reload)
    echo "Redémarrage des machines..."
    (cd server && vagrant reload)
    (cd client && vagrant reload)
    ;;
  *)
    echo "Usage: $0 {up|halt|destroy|reload}"
    exit 1
    ;;
esac

