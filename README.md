# postgresql_-2018-07-15-florian-matthieu


## Scripts

 **⚠ L'ensemble des scripts sont a exécuter en sudo ⚠** 
 
 
### Setup postgresql

Le fichier `setup_postgresql.sh` permet d'installer postgresql, version 11

A la fin de l'installation il renvoie la version :
`psql (PostgreSQL) 11.3 (Debian 11.3-1.pgdg90+1)`


### Import github archive

Le fichier `import_github.sh` permet d'importer l'archive github correspondant au jour donné (ici le 15/07/2018)

Les données sont extraites sous format JSON dans le dossier archive du projet


### Update configuration

Le fichier `update_configuration.sh` permet d'éditer les fichiers de configuration de base postgresql, ici on modifie le port par défaut : `5432 -> 1234`, et de changer la mémoire allouée 


### Create database

Le fichier `create_event_database` permet de mettre en place notre base de données : elle exécute diverses requêtes pour à la fois créer la base et les tables mais aussi d'insérer des données de tests
Le script renvoie trois Select attestant la bonne insertion des données au sein de la table


## Dossier SQL 
Ensemble des fichiers sql pour : 
1. Créer = `create_database.sql` 
2. Insérer = `insert_false_data.sql`
3. Modifier les configurations = `update_configuration.sql` de la base de données 

Ces différents fichiers sont appelés depuis les fichiers scripts.
