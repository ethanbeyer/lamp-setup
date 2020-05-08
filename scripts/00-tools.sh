#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ============= #
# installations #
# ============= #

printf "\n${GREEN}Installing Other Tools...${NC}\n"

# get the basis for all the stuff
git clone https://github.com/h5bp/server-configs-apache.git ~/configs/h5bp-apache2
cd ~/configs/h5bp-apache2
ls -la
sleep 5

cp -r ~/lamp-setup/configs/h5bp-apache2/* ~/configs/h5bp-apache2/
ls -la
sleep 5
