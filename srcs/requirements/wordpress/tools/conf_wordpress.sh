#!bin/sh

# To wait for the database to be ready
sleep 10

# Check if wordpress is already installed
if [ ! -e /var/www/wordpress/wp-config.php ]
then
  # First page
  wp config create --allow-root \
    --dbname=${SQL_DATABASE} \
    --dbuser=${SQL_USER} \
    --dbpass=${SQL_PASSWORD} \
    --dbhost=${SQL_HOST} \
    --dbcharset="utf8" \
    --dbcollate="utf8_general_ci" \
    --path='/var/www/wordpress'

  sleep 2

  # Second page
  wp core install --allow-root \
    --url=${WP_SITE_URL} \
    --title=${WP_SITE_TITLE} \
    --admin_user=${WP_ADMIN_USER} \
    --admin_password=${WP_ADMIN_PASSWORD} \
    --admin_email=${WP_ADMIN_EMAIL} \
    --skip-email \
    --path='/var/www/wordpress'

  sleep 2

  # Create user
  wp user create --allow-root \
    --role=author ${WP_USER} ${WP_USER_EMAIL} \
    --user_pass=${WP_USER_PASSWORD} \
    --path='/var/www/wordpress'
fi