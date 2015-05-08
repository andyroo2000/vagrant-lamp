#/usr/bin/env bash

echo "Installing Apache and setting apache up... please wait"
apt-get update >/dev/null 2>&1
apt-get install -y apache2 >/dev/null 2>&1
rm -rf /var/www
ln -fs /vagrant /var/www


echo "Installing Git"
apt-get install git -y >/dev/null 2>&1

echo "Installing PHP"
apt-get install php5-common php5-dev php5-cli php5-fpm -y >/dev/null 2>&1

echo "Installing PHP extensions"
apt-get install curl php5-curl php5-gd php5-mcrypt php5-mysql -y >/dev/null 2>&1

echo "Installing MySQL"
apt-get install debconf-utils -y >/dev/null 2>&1

debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"

apt-get install mysql-server -y >/dev/null 2>&1

