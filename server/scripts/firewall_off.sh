#!/bin/bash

echo "Désactivation du firewall (UFW)..."

# Désactiver UFW
sudo ufw --force disable

echo "Firewall désactivé."

