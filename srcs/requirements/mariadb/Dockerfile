FROM debian:buster

# Update and upgrade
RUN apt update && apt upgrade -y

# Install mariadb
RUN apt install mariadb-server -y

# Copy mariadb config
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Copy script to configure mariadb
COPY tools/configure.sh /tmp/configure.sh

# Execute sql commands to create database and user
RUN bash /tmp/configure.sh