# OS
FROM debian:buster

# Update and upgrade
RUN apt update && apt upgrade -y

# Install nginx
RUN apt install nginx -y

# Install vim
RUN apt install vim -y

# Install openssl
RUN mkdir -p /etc/nginx/ssl && apt install openssl -y

# Generate ssl key and certificate
RUN openssl req -x509 -nodes \
    -out /etc/nginx/ssl/synicole.42lausanne.ch.crt \
    -keyout /etc/nginx/ssl/synicole.42lausanne.ch.key \
    -subj "/C=CH/ST=Vaud/L=Lausanne/O=42/OU=42Lausanne/CN=login.42lausanne.ch/UID=synicole"

RUN rm -rf /etc/nginx/http.d/default.conf

# Copy nginx config
COPY conf/nginx.conf /etc/nginx/http.d/default.conf

# Expose port
EXPOSE 443

# Start nginx with daemon off
CMD ["nginx", "-g", "daemon off;"]

# Build command : docker build -t nginx .
# Run command : docker run -it -p 443:443 nginx