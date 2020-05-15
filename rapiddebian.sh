#!/bin/bash

echo "Please wait … This might take several minutes to complete …"

swapoff -a

dd if=/dev/zero of=/swapfile bs=1G count=4

mkswap /swapfile

swapon /swapfile

apt-get update -y

apt install apt-transport-https ca-certificates dirmngr gnupg software-properties-common -y

wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -

add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/

apt-get update -y 

apt install adoptopenjdk-8-hotspot -y

echo 'JAVA_HOME="/usr/lib/jvm/adoptopenjdk-8-hotspot-amd64"'  >> /etc/environment

source /etc/environment

apt-get install postgresql postgresql-contrib unzip -y

wget https://releases.rapidminer.com/latest/rapidminer-server/rapidminer-server-installer.zip

unzip rapidminer-server-installer.zip

apt-get install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils -y

apt-get install xrdp -y

adduser xrdp ssl-cert

systemctl restart xrdp