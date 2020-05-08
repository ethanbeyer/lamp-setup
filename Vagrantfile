Vagrant.configure("2") do |config|

    config.vm.box = "ubuntu/bionic64"

    config.vm.provider "virtualbox" do |v|
        v.name = "lamp-setup.box"
    end

    config.vm.network "private_network", ip: "233.0.0.17"

    config.vm.synced_folder ".", "/home/vagrant/lamp-setup"

end
