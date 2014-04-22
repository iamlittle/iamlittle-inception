# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Service Locator box
  config.vm.define :servicelocator do |servicelocator_config|
    servicelocator_config.vm.host_name = "servicelocator"

    servicelocator_config.vm.box = "iamlittle/ubuntu-docker"
    servicelocator_config.vm.provision "shell", path: "bootstrap.sh"
    servicelocator_config.vm.network "private_network", ip: "192.168.76.101"
  end

  # Web service box
  config.vm.define :webservice do |webservice_config|
    webservice_config.vm.host_name = "webservice"

    webservice_config.vm.box = "iamlittle/ubuntu-docker"
    webservice_config.vm.provision "shell", path: "bootstrap.sh"
  end

  # Web service box
  config.vm.define :webapp do |webapp_config|
    webapp_config.vm.host_name = "webapp"

    webapp_config.vm.box = "iamlittle/ubuntu-docker"
    webapp_config.vm.provision "shell", path: "bootstrap.sh"

    webapp_config.vm.network :forwarded_port, host: 80, guest: 80
  end

end

