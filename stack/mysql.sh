#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

MYSQL_CONFIG_DIR=~/configs/mysql
MYSQL_INIT_FILE=$MYSQL_CONFIG_DIR/reset.sql
MYSQL_ROOT_PASS=$1
MYSQL_SITE_USER=$2
MYSQL_SITE_PASS=$3

# ===== #
# MySQL #
# ===== #

printf "\n${GREEN}Configuring MySQL...${NC}\n\n\n"

printf "\n${GREEN}Stopping MySQL...${NC}\n\n\n"
sudo service mysql stop

printf "\n${GREEN}Creating Init File for MySQL...${NC}\n\n\n"
mkdir -p $MYSQL_CONFIG_DIR
touch $MYSQL_INIT_FILE
echo "UPDATE USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';" > $MYSQL_INIT_FILE
echo "CREATE USER '${MYSQL_SITE_USER}'@'localhost' IDENTIFIED BY '${MYSQL_SITE_PASS}';" >> $MYSQL_INIT_FILE
echo "GRANT ALL PRIVILEGES ON * . * TO '${MYSQL_SITE_USER}'@'localhost';" >> $MYSQL_INIT_FILE
echo "FLUSH PRIVILEGES;" >> $MYSQL_INIT_FILE

printf "\n${GREEN}Starting Safe Mode MySQL...${NC}\n\n\n"
sudo mysqld_safe --skip-grant-tables --init-file=$MYSQL_INIT_FILE &

# confirm it works
printf "\n${GREEN}Attempting to log in to MySQL...${NC}\n\n\n"
mysql -u root -p
> quit;

printf "\n${GREEN}Stopping safe mode MySQL...${NC}\n\n\n"
sudo service mysql stop

# printf "\n${GREEN}Secure Installation of MySQL...${NC}\n\n\n"
# sudo mysql_secure_installation

printf "\n${GREEN}Starting MySQL...${NC}\n\n\n"
sudo service mysql start

# printf "\n${GREEN}Removing MySQL Init file with plaintext passwords...${NC}\n\n\n"
# rm $MYSQL_INIT_FILE
