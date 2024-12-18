#!/bin/bash

# Pause pour s'assurer que MariaDB est bien lancé
sleep 10

# Si le fichier wp-config.php n'existe pas, créer la configuration
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    wp config create --allow-root \
        --dbname="$SQL_DATABASE" \
        --dbuser="$SQL_USER" \
        --dbpass="$SQL_PASSWORD" \
        --dbhost="mariadb:3306" \
        --path="/var/www/wordpress"
fi

# Installation de WordPress (configuration du site)
wp core install --allow-root \
    --url="http://localhost" \
    --title="MonSiteWordPress" \
    --admin_user="admin" \
    --admin_password="adminpassword" \
    --admin_email="admin@example.com" \
    --path="/var/www/wordpress"

# Création d'un deuxième utilisateur
wp user create --allow-root \
    second_user second_user@example.com \
    --role=editor \
    --user_pass="seconduserpassword" \
    --path="/var/www/wordpress"

# Lancer PHP-FPM
exec "$@"
