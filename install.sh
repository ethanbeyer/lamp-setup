#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

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
sudo apt autoremove

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
  phpmyadmin \
  python-certbot-apache \
  screen \
  software-properties-common \
  unzip \
  wget \
  zip \

printf "\n${GREEN}Done!${NC}\n\n\n"

touch ~/.handy-info
