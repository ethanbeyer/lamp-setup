# Setting Up the LAMP Server

Run these scripts in order to set up the lamp stack on AWS Lightsail.

After SSHing into the box, run these commands from the home directory.

```sh
sudo apt install git
git clone https://github.com/ethanbeyer/lamp-setup.git ~/lamp-setup

```

# Dev Setup

Run these scripts in order to set up the lamp stack on Vagrant Ubuntu 18.04.

```sh
vagrant up && vagrant ssh
devsync
./lamp-setup/scripts/setup.sh [databaseName]
```

Other helpful `vagrant` commands:

```sh
vagrant snapshot save [vm-name] NAME
vagrant snapshot restore [vm-name] NAME
vagrant snapshot list
vagrant snapshot delete [vm-name] NAME
```

list users in mysql: `mysql> select user,host from mysql.user;`

# Server Admin
`sudo mksite [website.com]`

# Helpful Links

- https://itsfoss.com/apt-vs-apt-get-difference/
- https://stackoverflow.com/questions/33470753/create-mysql-database-and-user-in-bash-script
- https://www.digitalocean.com/community/tutorials/how-to-install-linux-apache-mysql-php-lamp-stack-on-ubuntu-18-04
- https://www.digitalocean.com/community/tutorials/how-to-secure-apache-with-let-s-encrypt-on-ubuntu-18-04
