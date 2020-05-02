#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

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
