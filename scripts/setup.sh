#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ./00-tools.sh
# 
# 
# ===== #
# tools #
# ===== #

printf "\n${GREEN}Installing Needed Tools...${NC}\n"

touch ~/.handy-info

# get h5bp repo
git clone https://github.com/h5bp/server-configs-apache.git ~/configs/h5bp-apache2

# merge the overrides from this repo into h5bp
cp -r ~/lamp-setup/configs/h5bp-apache2/* ~/configs/h5bp-apache2/

echo "00-tools" >> ~/.handy-info

# ./01-linux.sh
# 
# 
# ============= #
# installations #
# ============= #

printf "\n${GREEN}Adding PHP Repo to apt...${NC}\n"
sleep 3
sudo add-apt-repository -y ppa:ondrej/php
sudo add-apt-repository -y ppa:ondrej/apache2
sudo add-apt-repository -y ppa:certbot/certbot

printf "\n${GREEN}Updating apt data...${NC}\n"
sleep 3
sudo apt -y update

printf "\n${GREEN}Upgrading apt packages...${NC}\n"
sleep 3
sudo apt -y upgrade

printf "\n${GREEN}Doing Full Upgrade to apt packages...${NC}\n"
sleep 3
sudo apt -y full-upgrade

printf "\n${GREEN}Removing unneeded apt packages...${NC}\n"
sleep 3
sudo apt -y autoremove

printf "\n${GREEN}Installing LAMP stack...${NC}\n"
sleep 5
sudo apt install -y \
  apache2 \
  certbot \
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
  python-certbot-apache \
  screen \
  software-properties-common \
  unzip \
  wget \
  zip \

printf "\n${GREEN}Done!${NC}\n\n\n"

echo "01-linux" >> ~/.handy-info

# ./02-apache.sh
# 
# 
# ====== #
# Apache #
# ====== #

printf "\n${GREEN}Configuring Apache...${NC}\n\n\n"

# we need these mods in order for a lot of things to function
sudo a2enmod \
    setenvif \
    headers \
    deflate \
    filter \
    expires \
    rewrite \
    include \
    proxy_fcgi

# apply those settings
sudo apache2ctl restart

# back up the current apache2 configuration
sudo cp -r /etc/apache2 /etc/apache.bak

# copy the main rule files
sudo cp -r ~/configs/h5bp-apache2/h5bp /etc/apache2/h5bp

# update the server root
sudo sed -i "s/#ServerRoot/ServerRoot/g" /etc/apache2/apache2.conf

# test the apache config file
sudo apache2 -t -f /etc/apache2/apache2.conf
sudo apache2ctl start

echo "02-apache" >> ~/.handy-info

# MAKE NOTE OF ROOT PASSWORD CREATED HERE
sudo mysql_secure_installation






./mysql.sh --host=localhost --database=$1 --user="$1_user"





# ./04-php
# 
# 
# === #
# PHP #
# === #

printf "\n${GREEN}Configuring PHP...${NC}\n\n\n"
sudo phpenmod mbstring
sudo systemctl restart apache2

echo "04-php" >> ~/.handy-info


# ./05-copy
# 
# 
# === #
# PHP #
# === #

# put the mksite command in ~/bin/mksite
mkdir -p ~/bin/mksite
cp ~/lamp-setup/bin/mksite ~/bin/mksite
chmod +x ~/bin/mksite
