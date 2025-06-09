#!/bin/bash

# Apache
yum install -y httpd httpd-devel httpd-tools
chkconfig --add httpd
chkconfig httpd on
service httpd stop

iptables -F
chmod -R 755 /var/www/html
setenforce 0

service httpd start

# PHP
yum install -y php php-cli php-common php-devel php-mysql

# Download Starter Content
cd /var/www/html
sudo -u vagrant wget -q https://raw.githubusercontent.com/Creationsv2/vagrant/refs/heads/main/files/index.html
sudo -u vagrant wget -q https://raw.githubusercontent.com/Creationsv2/vagrant/refs/heads/main/files/info.php


service httpd restart