#!/bin/bash

#Emplacement du script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


#Executer script SQL
sudo -u postgres psql -f $DIR/../sql/populate_raw_events.sql

#insertion des données dans la BDD
php populate_raw_events.php


#connexion a la BDD puis affichage des 10 premières lignes
