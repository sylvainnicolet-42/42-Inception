#!bin/sh

# To wait for the database to be ready
sleep 10

# Check if wordpress is already installed
if [ ! -e /var/www/wordpress/wp-config.php ]
then
    wp config create
      --allow-root \
      --dbname=${SQL_DATABASE} \
      --dbuser=${SQL_USER} \
      --dbpass=${SQL_PASSWORD} \
    	--dbhost=${SQL_HOST} \
    	--path='/var/www/wordpress'

#sleep 2
#wp core install     --url=$DOMAIN_NAME --title=$SITE_TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root --path='/var/www/wordpress'
#wp user create      --allow-root --role=author $USER1_LOGIN $USER1_MAIL --user_pass=$USER1_PASS --path='/var/www/wordpress' >> /log.txt
fi