# OS
FROM debian:buster

ARG SQL_DATABASE
ARG SQL_USER
ARG SQL_PASSWORD
ARG SQL_ROOT_PASSWORD

# Update and upgrade
RUN apt update && apt upgrade -y

# Install mariadb
RUN apt install mariadb-server -y

# Copy mariadb config
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Copy script to configure mariadb
COPY tools/conf_mariadb.sh /tmp/conf_mariadb.sh

# Run script to configure mariadb
RUN service mysql start && sh /tmp/conf_mariadb.sh

# Expose port
EXPOSE 3306

# Run mariadb
CMD ["mysqld"]

# Build command : docker build -t mariadb .
# Run command : docker run -it mariadb