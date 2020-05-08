#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# === #
# PHP #
# === #

printf "\n${GREEN}Configuring PHP...${NC}\n\n\n"
sudo phpenmod mbstring
sudo systemctl restart apache2
