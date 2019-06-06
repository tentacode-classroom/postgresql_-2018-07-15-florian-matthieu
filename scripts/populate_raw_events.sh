#!/bin/bash

#Emplacement du script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


#Executer script SQL
psql --username=github_events -f $DIR/../sql/populate_raw_events.sql

#insertion des données dans la BDD
php $DIR/populate_raw_events.php


#connexion a la BDD puis affichage des 10 premières lignes
psql --username=github_events -c "SELECT * FROM events_raw LIMIT 10"
