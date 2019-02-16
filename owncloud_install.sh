#!/bin/bash
clear
echo -e "\n"
echo "INSTALLATION OWNCLOUD OKLM ZERRRRRRRRRRRRRRRRRR"
echo -e "\n"
read -p "appuyez sur entrée pour commencer!!!!!!!!!"

wget -nv https://download.owncloud.org/download/repositories/production/Debian_9.0/Release.key -O Release.key
apt-key add - < Release.key
echo 'deb http://download.owncloud.org/download/repositories/production/Debian_9.0/ /' > /etc/apt/sources.list.d/owncloud.list
apt-get install apt-transport-https
apt-get update

apt install -y apache2 mariadb-server libapache2-mod-php7.0 \ php7.0-gd php7.0-json php7.0-mysql php7.0-curl \ php7.0-intl php7.0-mcrypt php-imagick \ php7.0-zip php7.0-xml php7.0-mbstring unzip


ou 


apt-get install -y apache2 mariadb-server libapache2-mod-php7.2 \
    openssl php-imagick php7.2-common php7.2-curl php7.2-gd \
    php7.2-imap php7.2-intl php7.2-json php7.2-ldap php7.2-mbstring \
    php7.2-mysql php7.2-pgsql php-smbclient php-ssh2 \
    php7.2-sqlite3 php7.2-xml php7.2-zip

apt-get install -y php-apcu php-redis redis-server php7.2-ldap


 
cd /var/www/html
wget https://download.owncloud.org/community/owncloud-10.0.10.zip

unzip owncloud-10.0.10.zip

ls

mkdir owncloud
rm owncloud-10.0.10.zip
mv owncloud*/ owncloud

chown -R www-data:www-data /var/www/html/owncloud


 /etc/apache2/sites-available/owncloud.conf
 
 
 
 
 autre tuto
 
 
apt install mariadb-server
 
systemctl start mariadb
systemctl enable mariadb
 
mysql_secure_installation

echo "

mysql -u root -p
MariaDB [(none)]> CREATE DATABASE owncloud CHARACTER SET utf8;
MariaDB [(none)]> GRANT ALL PRIVILEGES ON owncloud.* TO 'owncloud'@'localhost' IDENTIFIED BY 'owncloud_passwd';
MariaDB [(none)]> FLUSH PRIVILEGES;
MariaDB [(none)]> \q

"

apt install redis-server

apt install apache2 mariadb-server libapache2-mod-php7.0 \
    openssl php-imagick php7.0-common php7.0-curl php7.0-gd \
    php7.0-imap php7.0-intl php7.0-json php7.0-ldap php7.0-mbstring \
    php7.0-mcrypt php7.0-mysql php7.0-pgsql php-smbclient php-ssh2 \
    php7.0-sqlite3 php7.0-xml php7.0-zip php-redis php-apcu


 
sudo systemctl start apache2
sudo systemctl enable apache2
 
 
wget -qO- https://download.owncloud.org/download/repositories/stable/Debian_9.0/Release.key | apt-key add -

echo 'deb https://download.owncloud.org/download/repositories/stable/Debian_9.0/ /' | tee /etc/apt/sources.list.d/owncloud.list

apt install apt-transport-https

apt update 
apt install owncloud-files

echo "

Alias /owncloud "/var/www/owncloud/"

<Directory /var/www/owncloud/>
Options +FollowSymlinks
AllowOverride All

<IfModule mod_dav.c>
Dav off
</IfModule>

SetEnv HOME /var/www/owncloud
SetEnv HTTP_HOME /var/www/owncloud

</Directory>

" >  /etc/apache2/sites-available/owncloud.conf

a2ensite owncloud
systemctl restart apache2

chown -R www-data: /var/www/owncloud/

systemctl restart apache2

echo -e "\n"
echo "Informations réseau"
echo "--------------------"
ip a
echo -e "\n"
echo "Attention c'est à vous maintenant ! allez sur: http://IP/owncloud/"
echo -e "\n"
read -p "appuyez sur entrée pour terminer"

créer un nouvel utilisateur et s'est finie haaaaaaaaaaaaaaa 
 
 https://linuxhostsupport.com/blog/how-to-install-owncloud-10-on-debian-9/
 
 https://tecadmin.net/install-owncloud-on-debian-9/
 
 secirité et tout === https://www.kassianoff.fr/blog/fr/installation-configuration-owncloud
 
 
 ssl ===  https://wiki.debian.org/fr/owncloud
 
 https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/install-owncloud-9-on-ubuntu-16-04-debian-8.html
 
 
 
