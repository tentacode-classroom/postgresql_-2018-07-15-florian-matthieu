#!/bin/bash

#Emplacement du script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


#Executer script SQL
psql --username=github_events -f $DIR/../sql/populate_events.sql

#connexion a la BDD puis affichage des 10 premières lignes
psql --username=github_events -c "SELECT * FROM push_events LIMIT 1"

psql --username=github_events -c "SELECT * FROM watch_events LIMIT 1"

psql --username=github_events -c "SELECT * FROM issue_events LIMIT 1"

psql --username=github_events -c "SELECT * FROM issue LIMIT 1"

