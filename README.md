# Dev

`vagrant up`

# Setting Up the LAMP Server

Run these scripts in order to set up the lamp stack on AWS Lightsail.

After SSHing into the box, run these commands from the home directory.

```sh
sudo apt install git
git clone https://github.com/ethanbeyer/lamp-setup.git ~/lamp-setup

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
