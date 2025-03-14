#!/bin/bash

echo "Test d'accès HTTP (port 80) au serveur..."
curl -I http://192.168.56.10

echo ""
echo "🔎 Test d'accès SSH au serveur..."
ssh vagrant@192.168.56.10 "echo 'Connexion SSH réussie depuis le client.'"

if [ $? -ne 0 ]; then
  echo "Connexion SSH échouée depuis le client."
fi

#!/bin/bash

# Définir l'adresse IP ou le nom d'hôte cible
cible="192.168.56.10"

# Effectuer une analyse des ports TCP courants
echo "Analyse des ports TCP courants sur $cible..."
nmap -F $cible

# Effectuer une analyse complète des ports TCP
echo "Analyse complète des ports TCP sur $cible..."
nmap -p- $cible

# Effectuer une analyse des ports UDP courants
echo "Analyse des ports UDP courants sur $cible..."
nmap -sU --top-ports 100 $cible

# Effectuer une détection de version des services
echo "Détection des versions des services sur $cible..."
nmap -sV $cible

# Effectuer une analyse complète avec détection de version et du système d'exploitation
echo "Analyse complète avec détection de version et du système d'exploitation sur $cible..."
nmap -A $cible
