# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Service Locator box
  config.vm.define :service_locator do |service_locator_config|
    service_locator_config.vm.box = "precise32"
    service_locator_config.vm.host_name = "servicelocator"

    service_locator_config.vm.box = "iamlittle/ubuntu-docker"
    service_locator_config.vm.provision "shell", path: "bootstrap.sh"
    service_locator_config.vm.network "private_network", ip: "192.168.76.101"
  end

  # Web boxes
  config.vm.define :webservice do |webservice_config|
    webservice_config.vm.box = "precise32"
    webservice_config.vm.host_name = "webservice"

    webservice_config.vm.box = "iamlittle/ubuntu-docker"
    webservice_config.vm.provision "shell", path: "bootstrap.sh"

    webservice_config.vm.network :forwarded_port, host: 80, guest: 80
    webservice_config.vm.network "private_network", ip: "192.168.76.102"
  end

end

