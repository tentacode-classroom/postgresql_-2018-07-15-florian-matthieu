#!/bin/bash

#Ajouter la source du repo postgres
echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list

#Importer clé du repo
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
apt-get update

#Installer postgres version 11
apt-get install postgresql-11 -y

#Afficher la version
echo "Installation terminée : " 
psql -V

service postgresql start
