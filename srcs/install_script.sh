#! /bin/bash

rm /etc/nginx/sites-enabled/default && mv default.conf /etc/nginx/conf.d

cp wordpress-5.6-fr_FR.tar /usr/share/nginx/html && cd /usr/share/nginx/html/ && tar -xf wordpress-5.6-fr_FR.tar && rm /wordpress-5.6-fr_FR.tar

cd /

mv phpMyAdmin-5.0.4-all-languages.tar /usr/share/nginx/html && cd /usr/share/nginx/html && tar -xf phpMyAdmin-5.0.4-all-languages.tar && mv phpMyAdmin-5.0.4-all-languages phpmyadmin && rm phpMyAdmin*.tar && mv /config.inc.php /usr/share/nginx/html/phpmyadmin/ && rm phpmyadmin/config.sample.inc.php
mkdir -p /usr/share/nginx/html/phpmyadmin/tmp
chmod 777 /usr/share/nginx/html/phpmyadmin/tmp

cd /

mv info.php /usr/share/nginx/html/

service mysql start
bash mysql_secure.sh

echo "CREATE DATABASE blog;" | mysql -u root
echo "CREATE USER \"blog\"@\"localhost\";" | mysql -u root
echo "SET password FOR \"blog\"@\"localhost\" = password('pass');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON blog.* TO \"blog\"@\"localhost\" IDENTIFIED BY \"pass\""| mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

mv wp-config.php /usr/share/nginx/html/wordpress/

nginx -s reload
service nginx start 
service php7.3-fpm start

tail -F /var/log/nginx/error.log
