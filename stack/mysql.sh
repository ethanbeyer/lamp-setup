#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

MYSQL_CONFIG_DIR=~/configs/mysql
MYSQL_INIT_FILE=~$MYSQL_CONFIG_DIR/reset.sql
MYSQL_ROOT_PASS=''
MYSQL_SITE_USER=''
MYSQL_SITE_PASS=''

# ============== #
# configurations #
# ============== #

# MySql
printf "\n${GREEN}Configuring MySQL...${NC}\n\n\n"
sudo mysql_secure_installation
sudo phpenmod mbstring
sudo systemctl restart apache2

sudo service mysql stop
mkdir -p $MYSQL_CONFIG_DIR
echo "UPDATE mysql.user SET Password = PASSWORD('${PASS}') WHERE User = 'root';" > $MYSQL_INIT_FILE
echo "CREATE USER '${MYSQL_SITE_USER}'@'localhost' IDENTIFIED BY 'password';" >> $MYSQL_INIT_FILE
echo "GRANT ALL PRIVILEGES ON * . * TO '${MYSQL_SITE_USER}'@'localhost';" >> $
echo "FLUSH PRIVILEGES;" >> $MYSQL_INIT_FILE

chown mysql:mysql $MYSQL_INIT_FILE
mysqld_safe --init-file=$MYSQL_INIT_FILE &
rm $MYSQL_INIT_FILE

# confirm it works
mysql -u root --password=$PASS
> quit;

sudo service mysql start
