#!/bin/bash

# Update CentOS with any patches
yum update -y --exclude=kernel

# Tools
yum install -y nano git unzip screen

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

iptables -F
rm -rf /var/www/html
chmod -R 755 /var/www/html
setenforce 0

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# mysql
yum install -y mysql mysql-server mysql-devel
chkconfig --add mysqld
chkconfig mysqld on

service mysqld start

mysql -u root -e "SHOW DATABASES";

# Download Starter Content
cd /vagrant
sudo -u vagrant wget -q https://raw.githubusercontent.com/Creationsv2/vagrant/refs/heads/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/Creationsv2/vagrant/refs/heads/main/files/info.php


service httpd restart