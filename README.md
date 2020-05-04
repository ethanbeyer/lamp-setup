# Setting Up the LAMP Server

Run these scripts in order to set up the lamp stack on AWS Lightsail.

After SSHing into the box, run these commands from the home directory.

```sh
sudo apt install git
git clone https://github.com/ethanbeyer/lamp-setup.git ~/setup/lamp
./setup/lamp/install.sh
```

### Helpful Links

- https://itsfoss.com/apt-vs-apt-get-difference/

# Manage VHosts sites

`cd ~/configs/apache2/vhosts`

## Creating a new site

```sh
cp templates/example.com.conf .actual-hostname.conf
sed -i 's/example.com/actual-hostname/g' .actual-hostname.conf
```

## Enabling a site

```sh
mv .actual-hostname.conf actual-hostname.conf
```

## Disabling a site
```sh
mv actual-hostname.conf .actual-hostname.conf
```

After any of these operations, run `sudo apache2ctl reload`
