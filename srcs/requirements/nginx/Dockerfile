FROM debian:buster

# Installation des programmes
RUN apt update && apt install -y nginx \
	openssl

# Création des répertoires nécessaires
RUN mkdir -p /var/run/nginx /etc/nginx/ssl

# Generation du certificat SSL
RUN openssl req -x509 -nodes \
	-out /etc/nginx/ssl/anmassy.crt \
	-keyout /etc/nginx/ssl/anmassy.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

# Copie du fichier de configuration NGINX
COPY conf/nginx.conf /etc/nginx/nginx.conf

# Commande pour démarrer NGINX
CMD ["nginx", "-g", "daemon off;"]