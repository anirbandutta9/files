#!/bin/bash

banner rapidminer 

banner()
{
  echo "+------------------------------------------+"
  printf "| %-40s |\n" "`date`"
  echo "|                                          |"
  printf "|`tput bold` %-40s `tput sgr0`|\n" "$@"
  echo "+------------------------------------------+"
}

banner "One Click RapidMiner Server Installation Started.
Please wait !!  This might take several minutes to complete !! "

swapoff -a

dd if=/dev/zero of=/swapfile bs=1G count=4

mkswap /swapfile

swapon /swapfile

apt-get update -y

apt-get install openjdk-8-jdk postgresql postgresql-contrib unzip -y

echo 'JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64/bin"'  >> /etc/environment

source /etc/environment

wget https://releases.rapidminer.com/latest/rapidminer-server/rapidminer-server-installer.zip

unzip rapidminer-server-installer.zip

cd rapidminer-server-installer-9.6.0/bin

wget https://files.anirbandutta.in/rapidinstall.xml

su postgres  << END_OF_SCRIPT
psql << END_OF_SCRIPT
CREATE DATABASE rapidminer_server;
CREATE USER rapidminer WITH ENCRYPTED PASSWORD 'rapidminer';
GRANT ALL PRIVILEGES ON DATABASE rapidminer_server TO rapidminer;
END_OF_SCRIPT




cd rapidminer-server-installer-9.6.0/bin

bash rapidminer-server-installer rapidinstall.xml

cd /root/rapidminer-server/rapidminer-server-9.6.0/bin

./standalone.sh






