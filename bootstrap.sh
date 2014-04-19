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
apt-get install -y unzip

if [ ! -f "/usr/bin/fig" ] ; then
    wget https://github.com/orchardup/fig/releases/download/0.3.2/linux 
    mv ./linux /usr/bin/fig
    chmod +x /usr/bin/fig
fi


if [ ! -f "/usr/bin/serf" ] ; then
    wget https://dl.bintray.com/mitchellh/serf/0.5.0_linux_amd64.zip
    unzip 0.5.0_linux_amd64.zip
    mv ./serf /usr/bin/serf
    chmod +x /usr/bin/serf
fi
