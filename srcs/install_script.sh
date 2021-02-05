#! /bin/bash

rm /etc/nginx/sites-enabled/default && mv default.conf /etc/nginx/conf.d

cp wordpress-5.6-fr_FR.tar /var/www/ && cd /var/www && tar -xf wordpress-5.6-fr_FR.tar && rm /wordpress-5.6-fr_FR.tar

cd /

mv phpMyAdmin-5.0.4-all-languages.tar /usr/share/nginx/html && cd /usr/share/nginx/html && tar -xf phpMyAdmin-5.0.4-all-languages.tar && mv phpMyAdmin-5.0.4-all-languages phpmyadmin && rm phpMyAdmin*.tar && mv /config.inc.php /usr/share/nginx/html/phpmyadmin/ && rm phpmyadmin/config.sample.inc.php

cd /

mv info.php /usr/share/nginx/html/

bash mysql_secure.sh

nginx -s reload
service nginx start 
service mysql start
service php7.3-fpm start

tail -F /var/log/nginx/error.log
