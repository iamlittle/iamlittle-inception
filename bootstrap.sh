#!/usr/bin/env bash

# install docker
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
apt-get update
sh -c "echo deb http://get.docker.io/ubuntu docker main\
    > /etc/apt/sources.list.d/docker.list"
apt-get update
apt-get install -y lxc-docker

# add vagrant user to docker group
usermod -aG docker vagrant

#install pip, and ipython
apt-get install -y python-pip
apt-get install -y ipython-notebook

#install flask
pip install flask
pip install ipdb

#install java
# apt-get purge openjdk* 
# echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
# add-apt-repository -y ppa:webupd8team/java
# apt-get -y update 
# apt-get install -y oracle-java8-installer
# apt-get install -y ant 

# #install play
# apt-get install -y unzip
# if [ -f "$HOME/bin/play" ] ; then
#     wget http://downloads.typesafe.com/play/2.2.2/play-2.2.2.zip
#     unzip play-2.2.2.zip
#     chmod +x play-2.2.2/play
#     mkdir bin
#     ln -s play-2.2.2/play bin/play
# fi



