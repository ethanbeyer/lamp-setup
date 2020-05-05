#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ====== #
# Apache #
# ====== #

# https://github.com/h5bp/server-configs-apache#directly
git clone https://github.com/h5bp/server-configs-apache.git ~/setup/h5bp-apache

printf "\n${GREEN}Making Apache Configs Directory...${NC}\n\n\n"
mkdir -p ~/configs/apache2

printf "\n${GREEN}Copying configs from H5BP to config directory...${NC}\n\n\n"
cp -r ~/setup/h5bp-apache/* ~/configs/apache2

printf "\n${GREEN}Configuring Apache...${NC}\n\n\n"
sudo service apache2 stop

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
# sudo /etc/init.d/apache2 restart
# sudo a2enconf php7.4-fpm



# printf "\n${GREEN}Symlinking...${NC}\n\n\n"
# sudo ln -s ~/configs/apache2 /usr/local/apache2

# # install-specific edits

# printf "\n${GREEN}Starting Apache...${NC}\n\n\n"
# sudo apache2 -t -f /usr/local/apache2/httpd.conf
# sudo apache2ctl reload
