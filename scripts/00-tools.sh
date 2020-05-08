#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ============= #
# installations #
# ============= #

printf "\n${GREEN}Installing Other Tools...${NC}\n"

touch ~/.handy-info

# get h5bp repo
git clone https://github.com/h5bp/server-configs-apache.git ~/configs/h5bp-apache2

# merge the overrides from this repo into h5bp
cp -r ~/lamp-setup/configs/h5bp-apache2/* ~/configs/h5bp-apache2/

# put the mksite command in ~/bin/mksite
mkdir -p ~/bin/mksite
cp ~/lamp-setup/bin/mksite ~/bin/
chmod +x ~/bin/mksite

echo "00-tools" >> ~/.handy-info
