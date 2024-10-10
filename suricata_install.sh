#!/bin/bash

# Mettre à jour le système
sudo apt update && sudo apt upgrade -y

# Installer les dépendances nécessaires
sudo apt install -y software-properties-common build-essential libpcap-dev libpcre3-dev \
zlib1g-dev libyaml-dev pkg-config libnet1-dev libcap-ng-dev libmagic-dev \
libjansson-dev libnss3-dev libgeoip-dev

# Ajouter le PPA de Suricata
sudo add-apt-repository ppa:oisf/suricata-stable -y
sudo apt update

# Installer Suricata
sudo apt install -y suricata

# Télécharger et mettre à jour les règles Emerging Threats
sudo apt install -y suricata-update
sudo suricata-update

# Configurer Suricata (modifiez l'interface réseau eth0 si nécessaire)
sudo sed -i 's/interface: eth0/interface: YOUR_INTERFACE/' /etc/suricata/suricata.yaml

# Démarrer Suricata en mode IDS
sudo systemctl start suricata
sudo systemctl enable suricata

# Vérifier l'installation de Suricata
suricata --build-info

echo "Installation de Suricata terminée. Les alertes peuvent être vérifiées dans /var/log/suricata."
