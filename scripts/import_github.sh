#!/bin/bash

#Recuperer le repertoire du script (Merci StackOverflow)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

#Importer le fichier au format JSON
rm -rf $DIR/../archive
wget https://data.gharchive.org/2018-07-15-12.json.gz -O archive.json.gz
mkdir -p $DIR/../archive
touch $DIR/../archive/archive.json
gunzip -c archive.json.gz > $DIR/../archive/archive.json
rm archive.json.gz
echo "Fichier importé"
