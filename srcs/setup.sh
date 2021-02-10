#! /bin/bash

apt update
apt install -y wget

# # # #
apt install -y vim
# # # #

# nginx installation and configuration
apt install -y nginx
mkdir -p /var/www/localhost
cp /root/nginx_host_conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
cp /root/index.html /var/www/localhost
if [ $INDEX==on ]
then
	echo "autoindex on" >> /etc/nginx/sites-available/localhost
fi

# mariadb installation
apt install -y mariadb-server
service mysql start

apt-get -y install expect
SECURE_MYSQL=$(expect -c "
set timeout 10
spawn mysql_secure_installation
expect \"Enter current password for root (enter for none):\"
send \"n\r\"
expect \"Change the root password?\"
send \"n\r\"
expect \"Remove anonymous users?\"
send \"y\r\"
expect \"Disallow root login remotely?\"
send \"y\r\"
expect \"Remove test database and access to it?\"
send \"y\r\"
expect \"Reload privilege tables now?\"
send \"y\r\"
expect eof
")
echo "$SECURE_MYSQL"
apt-get -y purge expect

# creating the database for wordpress
echo "CREATE DATABASE blog;" | mysql -u root
echo "CREATE USER \"blog\"@\"localhost\";" | mysql -u root
echo "SET password FOR \"blog\"@\"localhost\" = password('pass');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON blog.* TO \"blog\"@\"localhost\" IDENTIFIED BY \"pass\""| mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

# installing php and phpmyadmin
apt install -y php-fpm php-mysql
apt install -y php-{mbstring,zip,gd,xml,pear,gettext,cgi}
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
mkdir /var/www/localhost/phpmyadmin
tar xf phpMyAdmin* --strip-components=1 -C /var/www/localhost/phpmyadmin
rm phpMyAdmin-*
mv /root/config.inc.php /var/www/localhost/phpmyadmin 

# installing wordpress
#phpextensions
apt install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip
wget http://fr.wordpress.org/latest-fr_FR.tar.gz
tar xf latest-fr_FR.tar.gz
rm latest-fr_FR.tar.gz
mv wordpress/ /var/www/localhost/
mv /root/wp-config.php /var/www/localhost/wordpress/
mkdir /var/www/localhost/phpmyadmin/tmp
chmod 777 /var/www/localhost/phpmyadmin/tmp
mysql < /var/www/localhost/phpmyadmin/sql/create_tables.sql -u root

# generating certificate for ssl connection
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=FR/ST=France/L=Lyon/emailAddress=ncatrien@student.42lyon.fr" \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt

service php7.3-fpm start
nginx -s reload
service nginx start
tail -f /var/log/nginx/error.log
