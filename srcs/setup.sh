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

## ssl setup with mkcert
#apt install -y libnss3-tools
#wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.3.0/mkcert-v1.3.0-linux-amd64
#chmod +x mkcert
#mv mkcert /usr/local/bin
#mkcert -install
#mkcert localhost

# ssl certificate with openssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-subj "/C=FR/ST=France/L=Lyon/emailAddress=ncatrien@student.42lyon.fr" \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt

# mariadb installation
apt install -y mariadb-server
service mysql start
echo "CREATE DATABASE blog;" | mysql -u root
echo "CREATE USER \"blog\"@\"localhost\";" | mysql -u root
echo "SET password FOR \"blog\"@\"localhost\" = password('pass');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON blog.* TO \"blog\"@\"localhost\" IDENTIFIED BY \"pass\""| mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

# php installation
apt install -y php-fpm php-mysql
echo "<?php\nphpinfo();\n?>" > /var/www/localhost/info.php

service nginx start
