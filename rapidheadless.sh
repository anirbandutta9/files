#!/bin/bash

echo "Please wait … This might take several minutes to complete …"

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



