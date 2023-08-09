FROM debian:buster

# Update and upgrade
RUN apt update && apt upgrade -y

# Install nginx
RUN apt install nginx -y

# Install vim
RUN apt install vim -y

# Install openssl
RUN mkdir -p /etc/nginx/ssl && \
    apt install openssl -y && \
    openssl req -x509 -nodes  \
    -out /etc/nginx/ssl/inception.crt  \
    -keyout /etc/nginx/ssl/inception.key  \
    -subj "/C=CH/ST=Switzerland/L=Lausanne/O=42/OU=42Lausanne/CN=login.42lausanne.ch/UID=synicole"

# Copy nginx config
COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

# Rights
RUN chmod 755 /var/www/html && \
    chown -R www-data:www-data /var/www/html

# Start nginx \
CMD ["nginx", "-g", "daemon off;"]