#!/bin/bash

# Démarrer MariaDB
service mysql start

# Créer la base de données si elle n'existe pas
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"

# Créer l'utilisateur et attribuer les permissions
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"

# Modifier le mot de passe root
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"

# Arrêter MariaDB proprement
mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

# Lancer MariaDB en mode daemon
exec mysqld
