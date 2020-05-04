#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# ============== #
# configurations #
# ============== #

# MySql
printf "\n${GREEN}Configuring MySQL...${NC}\n\n\n"
sudo mysql_secure_installation
sudo phpenmod mbstring
sudo systemctl restart apache2

mysql -u root -p
SELECT user,authentication_string,plugin,host FROM mysql.user;
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'testing_pass';
exit;
