#!/bin/bash

# Mettre à jour le système
sudo apt update && sudo apt upgrade -y

# Installer les dépendances nécessaires
sudo apt install -y build-essential libpcap-dev libpcre3-dev libdumbnet-dev bison flex zlib1g-dev

# Télécharger et installer DAQ
DAQ_VERSION="2.0.7"
wget https://www.snort.org/downloads/snort/daq-${DAQ_VERSION}.tar.gz
tar -xvzf daq-${DAQ_VERSION}.tar.gz
cd daq-${DAQ_VERSION}
./configure
make
sudo make install
cd ..

# Télécharger et installer Snort
SNORT_VERSION="2.9.20"
wget https://www.snort.org/downloads/snort/snort-${SNORT_VERSION}.tar.gz
tar -xvzf snort-${SNORT_VERSION}.tar.gz
cd snort-${SNORT_VERSION}
./configure --enable-sourcefire
make
sudo make install
cd ..

# Créer les répertoires nécessaires
sudo mkdir -p /etc/snort/rules
sudo mkdir -p /var/log/snort
sudo mkdir -p /usr/local/lib/snort_dynamicrules

# Copier le fichier de configuration par défaut
sudo cp etc/snort.conf /etc/snort/

# Télécharger les règles (ceci nécessite un compte sur snort.org)
# Vous pouvez automatiser cette partie une fois connecté à votre compte et en obtenant le lien de téléchargement des règles.

# Configurer les chemins des règles dans snort.conf
sudo sed -i 's#var RULE_PATH ../rules#var RULE_PATH /etc/snort/rules#' /etc/snort/snort.conf
sudo sed -i 's#var SO_RULE_PATH ../so_rules#var SO_RULE_PATH /usr/local/lib/snort_dynamicrules#' /etc/snort/snort.conf

# Vérifier l'installation de Snort
sudo snort -T -i eth0 -c /etc/snort/snort.conf

echo "Installation de Snort terminée. Modifiez le fichier /etc/snort/snort.conf selon vos besoins."
