# OS
FROM debian:buster

# Update and upgrade
RUN apt update && apt upgrade -y

# Install wget & vim
RUN apt install wget -y && apt install vim -y

# Install PHP
RUN apt-get install php7.3 -y \
            php-fpm \
			php-mysql \
			mariadb-client

# Copy PHP config
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Create run directory for php-fpm
RUN mkdir -p /run/php

# Download Wordpress
#RUN wget https://fr.wordpress.org/wordpress-6.3-fr_FR.tar.gz -P /var/www

# Unzip Wordpress
#RUN cd /var/www && tar -xzf wordpress-6.3-fr_FR.tar.gz && rm wordpress-6.3-fr_FR.tar.gz

# Give rights
#RUN chmod 755 /var/www/wordpress && chown -R www-data:www-data /var/www/wordpress

# Copy script to configure wordpress
COPY ./tools/conf_wordpress.sh /tmp/conf_wordpress.sh

EXPOSE 9000

# Fill wp-config.php with env variables
ENTRYPOINT ["sh", "/tmp/conf_wordpress.sh"]

# Run PHP (-F : stay in foreground)
CMD ["php-fpm7.3", "-F"]

# Build command : docker build -t wordpress .
# Run command : docker run -it wordpress