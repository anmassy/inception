# Étape 1 : Utilisation de l'image Debian comme base
FROM debian:buster

# Étape 2 : Mise à jour et mise à niveau du système
RUN apt-get update && apt-get upgrade -y \
	&& apt-get install -y mariadb-server \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

# Étape 3 : Copie du fichier de configuration
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Étape 4 : Copie du script de configuration automatique
COPY tools/auto_config.sh /usr/local/bin/auto_config.sh
RUN chmod +x /usr/local/bin/auto_config.sh

# Étape 5 : Commande de lancement
ENTRYPOINT ["/usr/local/bin/auto_config.sh"]
CMD ["mysqld"]
