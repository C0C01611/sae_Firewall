# Journal de projet - [SAE Firewall]

```
/sae_firewall
├── vagrant.sh
├── connection.sh
|
├── server/
│   ├── Vagrantfile
│   └── scripts/
|		├── firewall_off.sh
|		├── firewall_on.sh
|		└──	test_access.sh
|
└── client/
    ├── Vagrantfile
    └── scripts/
		├──	connection_server.sh
		├──	genkey.sh
		└──	test_access.sh 

```


## Equipe
- MOREAU Morgan
- LIEBART Corentin

## Description du projet

Ce projet vise la mise en place d'un firewall et le durcissement de la sécurité d'un serveur web sous Nginx. L'objectif est d'étudier et d'expérimenter des solutions de protection contre les attaques réseau en utilisant des outils tels que iptables, ufw, et divers outils de test de pénétration.

## Objectifs

- [ ] Mettre en place un firewall et démontrer son efficacité.
- [ ] Sécuriser un serveur web Nginx et réduire sa surface d'attaque.
- [ ] Mettre en place une DMZ pour protéger le réseau local.
- [ ] Tester les vulnérabilités et documenter les améliorations de sécurité.
- [ ] Automatiser le déploiement des machines virtuelles et des configurations.

## Journal des progrès

### Séance 1 - [04/03/2025]

- **Ce qui a été accompli** :
  - Lecture et analyse du cahier des charges.
  - Recherche documentaire sur iptables, ufw, et Nginx.
  - Création du dépot Github.

---

### Séance 2 - [05/03/2025]

- **Ce qui a été accompli** :
  - Prise en main de Vagrant pour créer des machines virtuelles Debian.
 
- **Problèmes rencontrés** :
  - Difficultés avec les modules kernel non chargés.
  - Difficultés avec les versions Virtualbox.
  - Difficultés avec la configuration réseau des VM.
    
- **Solutions apportées** :
  - Ajustement du Vagrantfile pour une configuration stable.

- **Tâches à réaliser** :
  - Configurer le serveur web Nginx.
  - Tester l'accès depuis la machine client.

---

### Séance 3 - [06/03/2025]

- **Ce qui a été accompli** :
  - Mise en place et configuration de la DMZ.
  - Tests et validation des accès réseau (HTTP et SSH).
 
- **Problèmes rencontrés** :
  - Problèmes de connexion SSH depuis le client.

---

### Séance 4 - [10/03/2025]

- **Ce qui a été accompli** :
  - Mise en place et configuration de ufw.
  - Création des scripts pour : démarrer le firewall, pour l'arreter et pour tester son fonctionnement.
 
- **Problèmes rencontrés** :
  - Problèmes de connexion SSH depuis le client.
    
- **Solutions apportées** :
  - Ajout de la clé ssh du client sur le serveur 

---

### Séance 5/6 - [11-12/03/2025]

- **Ce qui a été accompli** :
  - Changement du Vagrantfile pour en faire 2
  - Création de scripts pour automatiser le configuration du serveur et les différentes connections en ssh.
 
- **Problèmes rencontrés** :
  - Problèmes de connexion SSH depuis le client.
    
---
