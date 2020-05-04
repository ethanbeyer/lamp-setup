#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ============== #
# configurations #
# ============== #

# Apache
printf "\n${GREEN}Configuring Apache...!${NC}\n\n\n"
sudo a2enmod setenvif headers deflate filter expires rewrite include proxy_fcgi
sudo a2enconf php7.4-fpm
sudo apache2ctl stop

# config apache with h5bp's repo
# https://github.com/h5bp/server-configs-apache#directly
git clone https://github.com/h5bp/server-configs-apache.git ~/setup/h5bp-apache

mkdir -p ~/configs/apache2
cp -r ~/setup/h5bp-apache/* ~/configs/apache2
sudo ln -s ~/configs/apache2 /usr/local/apache2

# install-specific edits
# not sure what these are, yet

sudo apache2ctl start
