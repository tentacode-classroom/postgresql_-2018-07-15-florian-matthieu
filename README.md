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

### Create users
Le fichier `create_users.sh` permet de créer les utilisateurs super_admin et github_events et de les associer à leur base de données et leur droit.

 - super_admin va obtenir les droits d'un *superuser* et est propriétaire de la base de données *super_admin*.
 - github_events va obtnir les droits d'un *utilisateur normal* et est propriétaire de la base de données *github_events* 
 
 

### Populate raw events 
Le fichier `populate_raw_events.sh` permet de créer la table *events_raw* dans laquelle il n'y a qu'une seule colonne des données du fichier JSON au format JSONB.
On insère ensuite les données présentent dans notre `archive` en appelant le fichier au format PHP `populate_raw_events.php `.
Puis, il affiche les 10 premières les lignes de notre base de données.



## Dossier SQL
L'ensemble des fichiers sql sont écrit au format SLQ pour :
1. Créer = `create_database.sql`, `create_users.sql`,`populate_raw_events.sql `
2. Insérer = `insert_false_data.sql`
3. Modifier les configurations = `update_configuration.sql` de la base de données

Ces différents fichiers sont appelés depuis les fichiers scripts.


## Dossier ETC
 Les fichiers présent dans ce dossier son les copies de nos fichiers `.pgpass`, `pg_hba.conf` .
 Le fichier `pgpass` permet aux utilisateurs de se connecter sans écrire les mot de passe.
 Le fichier `pg_hba.conf`  permet de choisir la façon dont l'utilisateur se connecte aux base de données.
