# Mise en place d’une plateforme de détection d’intrusions
## Introduction
Ce projet consiste à créer une plateforme de détection des intrusions. Nous allons préparer un lab local pour répondre aux besoins de ce projet. GNS3 est un bon outil à utiliser pour la création de ce lab.

Dans ce projet, le travail est divisé en trois parties :

- Étude et implémentation: une étude des attaques sur chaque couche (transport, internet, liaison de données). Cette étape inclut également l'implémentation de chaque attaque.
- Snort et Suricata: cette étape a pour objectif de faire une étude approfondie de Snort et Suricata, et d'analyser les différences entre les deux.
- Implémentation des attaques : la dernière étape consiste à implémenter les attaques et à les détecter à l'aide de Snort et Suricata.
## Etude et implémentation 
Pour la couche transport, nous étudierons trois attaques :
- Attaque SYN Flood
- Attaque UDP Flood
- Attaque TCP Reset
Pour la couche internet :
- Spoofing d'adresse IP
- Attaques par injection de paquets
- Attaques d'injection de fausses informations de routage
Pour la couche d'accès réseau :
- ARP Spoofing
- Attaque de déauthentification (ou déconnexion)
- MAC Spoofing