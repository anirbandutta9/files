#!/bin/bash


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

apt-get install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils -y

apt-get install xrdp -y

adduser xrdp ssl-cert

systemctl restart xrdp

apt-get install gnome-shell ubuntu-gnome-desktop -y





