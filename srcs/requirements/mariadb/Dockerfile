# OS
FROM debian:buster

# Update and upgrade
RUN apt update && apt upgrade -y

# Install mariadb
RUN apt install mariadb-server -y

# Copy mariadb config
COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Copy script to configure mariadb
COPY tools/conf_mariadb.sh /tmp/conf_mariadb.sh

# Expose port
EXPOSE 3306

# 1. Run mariadb
# 2. Execute sql commands to create database and user
# 3. Restart mariadb
ENTRYPOINT ["sh", "/tmp/conf_mariadb.sh"]

# Build command : docker build -t mariadb .
# Run command : docker run -it mariadb