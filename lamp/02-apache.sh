#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ====== #
# Apache #
# ====== #

printf "\n${GREEN}Configuring Apache...${NC}\n\n\n"
sudo apache2ctl stop

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

# these are the configs that came pre-installed
sudo a2disconf \
    charset \
    other-vhosts-access-log \
    localized-error-pages \
    security \
    serve-cgi-bin

sudo apache2ctl start

# back up the current apache2 configuration
sudo mv /etc/apache2 /etc/apache2.bak

# link the html5-boilerplate configs to the old location
sudo ln -s ~/setup/h5bp-apache2 /etc/apache2

# test the apache config file
sudo apache2 -t -f /etc/apache2/httpd.conf

sudo apache2ctl reload -f /etc/apache2/httpd.conf
