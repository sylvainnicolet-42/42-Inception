# OS
FROM debian:buster

# Update and upgrade
RUN apt update && apt upgrade -y

# Install wget
RUN apt install wget -y

# Install PHP
RUN apt-get install php7.3 -y \
            php-fpm \
			php-mysql \
			mariadb-client

# Copy PHP config
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Download Wordpress
RUN wget https://fr.wordpress.org/wordpress-6.3-fr_FR.tar.gz -P /var/www

# Unzip Wordpress
RUN cd /var/www && tar -xzf wordpress-6.3-fr_FR.tar.gz && rm wordpress-6.3-fr_FR.tar.gz

# Give rights to wordpress folder
RUN chown -R root:root /var/www/wordpress

# Build command : docker build -t wordpress .
# Run command : docker run -it wordpress