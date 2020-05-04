#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

MYSQL_CONFIG_DIR=~/configs/mysql
MYSQL_INIT_FILE=$MYSQL_CONFIG_DIR/reset.sql
MYSQL_ROOT_PASS=''
MYSQL_SITE_USER=''
MYSQL_SITE_PASS=''

# ============== #
# configurations #
# ============== #

# MySql
printf "\n${GREEN}Configuring MySQL...${NC}\n\n\n"

sudo service mysql stop

mkdir -p $MYSQL_CONFIG_DIR
touch $MYSQL_INIT_FILE
echo "UPDATE USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASS}';" > $MYSQL_INIT_FILE
echo "CREATE USER '${MYSQL_SITE_USER}'@'localhost' IDENTIFIED BY '${MYSQL_SITE_PASS}';" >> $MYSQL_INIT_FILE
echo "GRANT ALL PRIVILEGES ON * . * TO '${MYSQL_SITE_USER}'@'localhost';" >> $
echo "FLUSH PRIVILEGES;" >> $MYSQL_INIT_FILE

mysqld_safe --init-file=$MYSQL_INIT_FILE &

# confirm it works
mysql -u root --password=$MYSQL_ROOT_PASS
> quit;

sudo service mysql stop

sudo mysql_secure_installation

sudo service mysql start

rm $MYSQL_INIT_FILE
