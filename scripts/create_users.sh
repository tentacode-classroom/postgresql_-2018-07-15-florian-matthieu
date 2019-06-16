#!/bin/bash

#Emplacement du script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


#connexion a la base de donnée et lancement du fichier sql
sudo -u postgres psql -f $DIR/../sql/create_users.sql

# création du fichier .pgpass + ajout identifiants
touch ~/.pgpass
chmod 0600 ~/.pgpass 
echo "*:*:*:super_admin:12345" > ~/.pgpass
echo "*:*:github_events:github_events:12345" >> ~/.pgpass

# connexion utilisateur super_admin
psql --username super_admin -c "SELECT 'Je suis connecté en super admin.';"

# connexion utilisateur github_events
#psql --username github_events -c "SELECT 'Je suis connecté sur github.';"
echo "On n'affiche pas la connexion à github_events car on ne crée la base que par la suite" 

