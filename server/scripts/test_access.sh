#!/bin/bash

echo "Test d'accès HTTP (port 80) au serveur..."
curl -I http://192.168.56.10

echo ""
echo "🔎 Test d'accès SSH au serveur..."
ssh vagrant@192.168.56.10 "echo 'Connexion SSH réussie depuis le client.'"

if [ $? -ne 0 ]; then
  echo "Connexion SSH échouée depuis le client."
fi

