# Setting Up the LAMP Server

Run these scripts in order to set up the lamp stack on AWS Lightsail.

After SSHing into the box, run these commands from the home directory.

```sh
sudo apt install git
git clone https://github.com/ethanbeyer/lamp-setup.git ~/setup

./setup/lamp/01-linux.sh

```

# Apache Configuration

`cd ~/configs/apache2/vhosts`

After any of these operations, run `sudo apache2ctl reload`

1. Creating a new site

```sh
cp templates/example.com.conf .domain.com.conf
sed -i 's/example.com/domain.com/g' .domain.com.conf
```

2. Enabling a site

```sh
mv .domain.com.conf domain.com.conf
```

3. Disabling a site

```sh
mv domain.com.conf .domain.com.conf
```

### Helpful Links

- https://itsfoss.com/apt-vs-apt-get-difference/
