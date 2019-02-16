#!/bin/bash

# TITRE: Installation Dokuwiki
#================================================================#
# DESCRIPTION: 
# Ce script va servir a installer Dokuwiki avec un minimum 
# d'intéractions.
#----------------------------------------------------------------#
# AUTEURS: Daniel DOS SANTOS < danielitto91@gmail.com >
#----------------------------------------------------------------#
# DATE DE CRÉATION: 28/07/2018
#----------------------------------------------------------------#
# USAGE: ./dokuku.sh
#----------------------------------------------------------------#
# BASH VERSION: GNU bash 4.4.12
#================================================================#
clear
apt-get update && apt-get upgrade -y

apt-get install apache2* libapache2-mod-php -y
apt-get install php7.0 -y
apt-get install libapache2-mod-php7.0 -y
apt-get install php7.0-xml -y
apt-get install php-mbstring -y

a2enmod rewrite
a2enmod proxy_fcgi setenvif
a2enconf php7.0-fpm

cd /var/www/html
wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz
tar xvf dokuwiki-stable.tgz
mv dokuwiki-*/ dokuwiki

chown -R www-data:www-data /var/www/html/dokuwiki

sed -r 's/DocumentRoot \/var\/www*/DocumentRoot \/var\/www\/html\/dokuwiki/g' /etc/apache2/sites-enabled/000*.conf

sed -r 's/AllowOverride None/AllowOverride All/g' /etc/apache2/apache2.conf

service apache2 restart

nom=$(w | grep tty* | cut -d" " -f1)
echo -e "\n"
echo "Informations réseau"
echo "--------------------"
ip a
echo -e "\n"
echo "Attention c'est à vous maintenant ! allez sur: http://IP/dokuwiki/install.php"
echo -e "\n"
read -p "appuyez sur entrée pour terminer l'installation! quand c'est fini seulement!!!!!!!"

rm /var/www/html/dokuwiki/install.php




