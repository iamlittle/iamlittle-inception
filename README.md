## inception

This project is a personal sandbox for experimenting with service discovery for multihost container deployments. The system consists of three Docker containers, two with a Flask front end. One is a webservice for generating an array of 10 Fibonacci numbers. Another is a web server that wraps the numbers and returns some html. The final container is essentially empty. All three containers have an etcd daemon that acts as the service discovery mechanism.

Serf was initially investigated in place of etcd, but it proved very particular about it's configuration. That's the nice way of saying I couldn't get it to play nice with multihost NAT. Etcd, while not as elegant as Serf, worked more or less right out of the box.

=======

### Getting up and running

You will need to have [Vagrant](http://www.vagrantup.com) installed. 

Please ensure that no service is operating on port 80 of your local machine.

=======
#### Single host deployment

 1. Check this project out.
 1. cd into the inception directory.
 1. Type `vagrant up webapp`. This will download and provision a Ubuntu based virtual machine. It may take a while the first time through.
 1. Type `vagrant ssh webapp`. This will give you a console for your newly minted vm.
 1. cd into `/vagrant`
 1. Type `make build`. This will download a base Docker image and construct four new images from it. The first is a base image, the other three are for the deployed system components. It may take a while the first time through.
 1. Type `make runsinglehost`. This will start the three Docker containers in the current vagrant machine. The system should be ready to go.
 1. Open a browser and visit localhost.

=======
#### Multihost deployment

 1. Check this project out.
 1. cd into the inception directory.
 1. Type `vagrant up`. This will download and provision a Ubuntu based virtual machine. It may take a while the first time through.
 1. The following steps need to be completed from three separate consoles to simulate a multihost environment. Each console will pertain to a `MACHINE_NAME` belonging to set `servicelocator, webapp, or webservice`
  1. Type `vagrant ssh $MACHINE_NAME` where MACHINE_NAME is each of `servicelocator, webapp, or webservice`. This will give you a console for your newly minted vm.
  1. cd into `/vagrant`
  1. Type `make build`. This will download a base Docker image and construct four new images from it. The first is a base image, the other three are for the deployed system components. It may take a while the first time through.
  1. Type `make run$MACHINE_NAME`. This will start a Docker container for `MACHINE_NAME` in the current vagrant machine. The system should be ready two go.
 1. After all three containers have been initialized, open a browser and visit localhost.


### Shutting down

#### Single host

 1. Type `make stopall` This will shutdown the Docker system.
 1. Type `exit` This will exit from the Vagrant ssh session.
 1. Type `vagrant halt` to shutdown the Vagrant machine. --or-- Type `vagrant destroy` to remove the vagrant instance from your machine.

#### Multihost

 1. Ctrl-c in each of the running containers consoles.
 1. Type `exit` from each ot the consoles.
 1. Type `vagrant halt` from one of the consoles to shutdown the machines. Use `vagrant destroy` to remove the VM instance from your machine 
 
 
