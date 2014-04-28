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
apt-get install -y python-pip

pip install requests

# if [ ! -d "/usr/local/go" ] ; then
#     wget https://go.googlecode.com/files/go1.2.1.linux-amd64.tar.gz
#     tar -C /usr/local -xzf go1.2.1.linux-amd64.tar.gz
#     echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
#     rm -rf go1.2.1.linux-amd64.tar.gz
# fi

if [ ! -d "/usr/local/bin/etcd" ] ; then
    wget https://github.com/coreos/etcd/releases/download/v0.3.0/etcd-v0.3.0-linux-amd64.tar.gz
    tar -xzvf etcd-v0.3.0-linux-amd64.tar.gz
    cp etcd-v0.3.0-linux-amd64/etcd /usr/local/bin/
fi
