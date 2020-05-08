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
vagrant up
vagrant ssh
devsync
./lamp-setup/scripts/00-tools.sh
./lamp-setup/scripts/01-linux.sh
./lamp-setup/scripts/02-apache.sh
./lamp-setup/scripts/03-mysql.sh [root pw] [username] [username pw]
./lamp-setup/scripts/04-php.sh
```

# Server Admin
`~/lamp-setup/bin/mksite [website.com]` @todo

## These will help with dev!
vagrant snapshot save [vm-name] NAME
vagrant snapshot restore [vm-name] NAME
vagrant snapshot list
vagrant snapshot delete [vm-name] NAME

# Apache Configuration

`cd ~/configs/apache2/vhosts` @todo

After any of these operations, run `sudo apache2ctl reload`

1. Creating a new site

@todo `sync` copy command on vagrant provision

### Helpful Links

- https://itsfoss.com/apt-vs-apt-get-difference/
