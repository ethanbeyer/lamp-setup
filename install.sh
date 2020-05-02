#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ============= #
# installations #
# ============= #
printf "\n${GREEN}Adding PHP Repo to apt...${NC}\n"
sudo add-apt-repository ppa:ondrej/php

printf "\n${GREEN}Updating apt data...${NC}\n"
sudo apt update

printf "\n${GREEN}Upgrading apt packages...${NC}\n"
sudo apt -y upgrade

printf "\n${GREEN}Doing Full Upgrade to apt packages...${NC}\n"
sudo apt full-upgrade

printf "\n${GREEN}Removing unneeded apt packages...${NC}\n"
sudo apt autoremove

printf "\n${GREEN}Installing LAMP stack...${NC}\n"
sudo apt install -y \
apache2 \
curl \
mysql-client \
mysql-server \
openssh-server \
php7.4 \
php7.4-bcmath \
php7.4-bz2 \
php7.4-cli \
php7.4-common \
php7.4-curl \
php7.4-fpm \
php7.4-gd \
php7.4-gettext \
php7.4-intl \
php7.4-mbstring \
php7.4-mysql \
php7.4-readline \
php7.4-xml \
php7.4-zip \
phpmyadmin \
screen \
software-properties-common \
unzip \
wget \
zip \

printf "\n${GREEN}Done!${NC}\n\n\n"






# ============== #
# configurations #
# ============== #

# Apache
# https://github.com/h5bp/server-configs-apache#directly
printf "\n${GREEN}Configuring Apache...!${NC}\n\n\n"
sudo a2enmod setenvif headers deflate filter expires rewrite include
sudo a2enconf php7.4-fpm # For Apache only
sudo services apache2 restart

sudo apache2ctl stop
git clone https://github.com/h5bp/server-configs-apache.git /tmp/h5bp-apache
cd /usr/local
cp -r apache2 apache2-previous
cp -r /tmp/h5bp-apache/* apache2
# install-specific edits
sudo apache2ctl start
cd

# MySql
# printf "\n${GREEN}Configuring MySQL...${NC}\n\n\n"
# sudo mysql_secure_installation
# sudo phpenmod mbstring
# sudo systemctl restart apache2

# mysql -u root -p
# SELECT user,authentication_string,plugin,host FROM mysql.user;
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'testing_pass';
# exit;

