FROM debian:bullseye 

ARG CRED_PATH CRED_CERT CRED_KEY COMMON_NAME

RUN apt update && apt upgrade -y && apt install -y nginx openssl gettext-base

RUN mkdir -p ${CRED_PATH}

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout ${CRED_PATH}/${CRED_KEY} \
-out ${CRED_PATH}/${CRED_CERT} \
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=${COMMON_NAME}"

COPY conf/nginx.conf ./tmp/nginx.conf

RUN envsubst '$CRED_PATH $CRED_KEY $CRED_CERT $COMMON_NAME' < /tmp/nginx.conf > /etc/nginx/sites-available/default

ENTRYPOINT ["nginx", "-g", "daemon off;"]