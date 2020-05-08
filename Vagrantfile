Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/bionic64"
    config.vm.provider "virtualbox" do |v|
        v.name = "lamp-setup.box"
    end

    config.vm.network "private_network", ip: "233.0.0.17"
    # config.ssh.username = "vagrant"
    # config.ssh.password = "vagrant"

    $provision_script = <<-SCRIPT
apt install git
git clone -b dev https://github.com/ethanbeyer/lamp-setup.git /home/vagrant/lamp-setup
sudo chown -R vagrant:vagrant /home/vagrant/lamp-setup
echo "export PATH=${PATH}:/vagrant/bin" >> /home/vagrant/.bashrc
SCRIPT

    config.vm.provision "shell", inline: $provision_script
    
end
