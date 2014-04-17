##fibDemo
=======

This project is a personal sandbox for learning how Docker works, how to do service discovery between Docker containers,
and how to make the system play nice with Vagrant.

The system consists of two Docker containers, both with a Flask front end. One is a webservice for generating an array of 10 Fibonacci numbers. The second is a web server that wraps the numbers and returns some html.

=======

### Getting up and running

You will need to have [Vagrant](http://www.vagrantup.com) installed. 

Please ensure that no service is operating on port 80 of your local machine, e.g. shutdown Apache.

 1. Check this project out.
 1. cd into the fibDemo directory.
 1. Type `vagrant up`. This will download and provision an Ubuntu based virtual machine. It may take a while the first time through.
 1. Type `vagrant ssh`. This will give you a console for your newly minted vm.
 1. Type `/vagrant/build.sh`. This will download a base Docker image and construct two new images from it. It may take a while the first time through.
 1. Type `/vagrant/start.sh. This will start the two Docker containers. The system should be ready two go.
 1. Open a browser and visit localhost.


### Shutting down

 1. Type `/vagrant/stop.sh` This will shutdown the Docker system.
 1. Type `exit` This will exit from the Vagrant ssh session.
 1. Type `vagrant halt` to shutdown the Vagrant machine. --or-- Type `vagrant destroy` to remove the vagrant instance from your machine.
 
 
