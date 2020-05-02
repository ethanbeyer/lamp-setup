# Setting Up the LAMP Server

Run these scripts in order to set up the lamp stack on AWS Lightsail.

After SSHing into the box, run these commands from the home directory.

```sh
sudo apt install git
git clone https://github.com/ethanbeyer/lamp-setup.git ~/setup/lamp
chmod +x setup/lamp/**/*.sh
./setup/lamp/install.sh
```

### Helpful Links

- https://itsfoss.com/apt-vs-apt-get-difference/
