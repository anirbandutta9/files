#!/bin/bash

echo "Enter domain name : "
read name

apt-get update -y

apt-get install nginx mariadb-server -y 

systemctl enable nginx 

systemctl enable mariadb

apt-get install php php-mysql php-cli php-cgi php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-curl php-imagick php-fpm -y

mkdir -p /var/www/html/wordpress

cd /etc/nginx/sites-available/

wget https://files.anirbandutta.in/wordpressnginx.conf

ln -s /etc/nginx/sites-available/wordpressnginx.conf  /etc/nginx/sites-enabled/wordpressnginx.conf

systemctl restart nginx 

cd /var/www/html/wordpress

wget https://wordpress.org/latest.tar.gz

tar -xvf latest.tar.gz

mv wordpress/*  /var/www/html/wordpress

chown -R www-data:www-data /var/www/html/wordpress

chmod -R 755 /var/www/html/wordpress

sed -i -e s/example.com/"$name"/g /etc/nginx/sites-available/wordpressnginx.conf

wget https://files.anirbandutta.in/mysqldbcreate.sh

chmod +x mysqldbcreate.sh

./mysqldbcreate.sh --host=localhost --database=wordpress --user=wordpressuser





