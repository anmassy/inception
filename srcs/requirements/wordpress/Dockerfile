# Étape 1 : Utilisation d'une image Debian comme base
FROM debian:buster

# Étape 2 : Installation des outils nécessaires
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y wget \
	php7.3 \
	php-fpm \
	php-mysql \
	mariadb-client

# Étape 3 : Téléchargement de WordPress
RUN wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz -P /var/www

# Étape 4 : Décompression de l'archive et nettoyage
RUN cd /var/www && tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

# Étape 7 : Configuration de PHP
# Modification de la configuration pour adapter PHP à WordPress
RUN echo "clear_env = no" >> /etc/php/7.3/fpm/php-fpm.conf && \
	echo "listen = wordpress:9000" >> /etc/php/7.3/fpm/pool.d/www.conf

# Étape 8 : Installation de WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

# Étape 9 : Copie du script de configuration automatique
COPY conf/auto_config.sh /usr/local/bin/auto_config.sh
RUN chmod +x /usr/local/bin/auto_config.sh

# Étape 10 : Création du dossier pour éviter une erreur PHP
RUN mkdir -p /run/php

# Étape 11 : Commande de lancement
ENTRYPOINT ["/usr/local/bin/auto_config.sh"]
CMD ["/usr/sbin/php-fpm7.4", "-F"]
