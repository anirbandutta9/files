#!/bin/bash
################################################################################
# Script for installing LAMP on Ubuntu 16.04, 18.04 and 20.04 (could be used for other version too)
# Author: Anirban Dutta
#-------------------------------------------------------------------------------
# This script will install apache, mariadb/mysql, php on your Ubuntu server.
#-------------------------------------------------------------------------------
# Make a new file:
# sudo nano lamp.sh
# Place this content in it and then make the file executable:
# sudo chmod +x lamp.sh
# Execute the script to install Odoo:
# ./lamp.sh
################################################################################

# Set sftp username for accessing website files via sftp 
SFTP_USER="developerftp"
# Set this to False if you don't need to install apache webserver
INSTALL_APACHE="True"
# Set this to False if you don't need to install PHP
INSTALL_PHP="True"
# Set this to False if you don't need to install any database server or Set this to MySQL if you need to install MySql server instead of MariaDB 
INSTALL_MYSQL="MariaDB"
# SET this to True if you need to create a database 
CREATE_DATABASE="False"
# Set the database name and user you want to create
DATABASE_NAME="web"
DATABASE_USER="webuser"
# Set this to True if you need to install PHPMYADMIN
INSTALL_PHPMYADMIN="False"
# Set your domain name to be mapped 
WEBSITE_NAME="example.com"
# Set this to False if you don't need to install Free SSL for Website
ENABLE_SSL="True"
# Set admin email for website
ADMIN_EMAIL="admin@example.com"
# Set this to True if you need to secure PhpMyAdmin installation
SECURE_PHPMYADMIN="False"
# Set this to True if you need to install modsecurity
INSTALL_MODSECURITY="False"
# Set this to True if you need to secure your site using .htaccess rules
SECURE_WEBSITE="False"


#--------------------------------------------------
# Update Server
#--------------------------------------------------
echo -e "\n---- Updating Server ----"
sudo apt-get update -y

if [ $INSTALL_APACHE = "True" ]; then
echo -e "\n---- Installing Apache Web Server ----"
apt-get install apache2 libapache2-mod-php -y
else
  echo "Apache server isn't installed due to the choice of the user!"
fi

if [ $INSTALL_PHP = "True" ]; then
echo -e "\n---- Installing PHP ----"
apt-get install php php-mysql libapache2-mod-php php-cli php-cgi php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip php-curl php-imagick php-bcmath php-redis -y
else
  echo "PHP isn't installed due to the choice of the user!"
fi

