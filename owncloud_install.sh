#!/bin/bash 
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
Alias /owncloud '/var/www/owncloud/'

<Directory /var/www/owncloud/>
Options +FollowSymlinks
AllowOverride All

<IfModule mod_dav.c>
Dav off
</IfModule>

SetEnv HOME /var/www/owncloud
SetEnv HTTP_HOME /var/www/owncloud

</Directory>" > /etc/apache2/sites-available/owncloud.conf

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

#créer un nouvel utilisateur et s'est finie haaaaaaaaaaaaaaa
#<<<<SOURCES>>>> :

# https://linuxhostsupport.com/blog/how-to-install-owncloud-10-on-debian-9/

#https://tecadmin.net/install-owncloud-on-debian-9/
 
# secirité === https://www.kassianoff.fr/blog/fr/installation-configuration-owncloud
 
# ssl ===  https://wiki.debian.org/fr/owncloud
 
# https://www.itzgeek.com/how-tos/linux/ubuntu-how-tos/install-owncloud-9-on-ubuntu-16-04-debian-8.html
 
 
 
