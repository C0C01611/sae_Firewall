# Réinitialiser UFW
sudo ufw reset

# 🔹 Autoriser HTTP (80) depuis tout le monde (client + externe)
sudo ufw allow 80/tcp

# 🔹 Autoriser SSH uniquement depuis le Client (LAN)
sudo ufw allow from 192.168.56.20 to any port 22 proto tcp

# ❌ Empêcher la DMZ (serveur) d'initier des connexions vers le LAN
sudo ufw deny out from 192.168.56.10 to 192.168.56.20

# Activer UFW
sudo ufw enable

# Vérifier la configuration
sudo ufw status verbose

