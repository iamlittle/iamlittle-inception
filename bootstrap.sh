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
apt-get install -y nmap


if [ ! -f "/usr/bin/fig" ] ; then
    wget https://github.com/orchardup/fig/releases/download/0.3.2/linux 
    mv ./linux /usr/bin/fig
    chmod +x /usr/bin/fig
fi

if [ ! -d "/usr/local/go" ] ; then
    wget https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz
    tar -C /usr/local -xzf go1.2.1.linux-amd64.tar.gz
    echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
    rm -rf go1.2.1.linux-amd64.tar.gz
fi

if [ ! -d "/home/vagrant/etcd" ] ; then
    git clone https://github.com/coreos/etcd
    . /etc/profile
    cd etcd
    ./build
    cd ../
    cp /home/vagrant/etcd/bin/etcd /vagrant/servicelocator/etcd
    cp /home/vagrant/etcd/bin/etcd /vagrant/webservice/etcd
    cp /home/vagrant/etcd/bin/etcd /vagrant/webapp/etcd
fi
