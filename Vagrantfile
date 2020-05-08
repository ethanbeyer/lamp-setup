Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/bionic64"

  $script = <<-SCRIPT
sudo apt install git
git clone -b dev https://github.com/ethanbeyer/lamp-setup.git /home/vagrant/lamp-setup
cd 
SCRIPT

  config.vm.provision "shell", inline: $script
end
