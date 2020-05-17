apt-get update -y

apt-get install nginx mariadb-server -y 

systemctl enable nginx 

systemctl enable mariadb

apt-get install php php-mysql libapache2-mod-php php-cli php-cgi php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-curl php-imagick php-fpm -y

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










