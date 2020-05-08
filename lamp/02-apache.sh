#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

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

# back up the current apache2 configuration
sudo cp -r /etc/apache2 /etc/apache.bak

# copy the main rule files
sudo cp -r ~/setup/h5bp-apache2/h5bp /etc/apache2/h5bp

# copy the vhost templates
sudo cp -r ~/setup/h5bp-apache2/vhosts/templates /etc/apache2/sites-available/templates

# test the apache config file
sudo apache2 -t -f /etc/apache2/apache2.conf
sudo apache2ctl start -f /etc/apache2/apache2.conf
