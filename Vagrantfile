Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  $script = <<-SCRIPT
apt install git
git clone -b dev https://github.com/ethanbeyer/lamp-setup.git /home/vagrant/lamp-setup
sudo chown -R vagrant:vagrant /home/vagrant/lamp-setup
echo "export PATH=${PATH}:/vagrant/bin/devsync" >> /home/vagrant/.bashrc
SCRIPT

  config.vm.provision "shell", inline: $script
end
