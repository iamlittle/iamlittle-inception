# servicelocator
#
# VERSION       1

# use the flask base image 
FROM iamlittle/flask

MAINTAINER Aaron Little alittle@opalytics.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# install utilities
RUN apt-get install -y wget
RUN apt-get install -y curl
RUN apt-get install -y nmap
RUN apt-get install -y netstat-nat

#install requests
RUN apt-get install -y python-pip
RUN pip install requests

# install etcd
RUN wget https://github.com/coreos/etcd/releases/download/v0.3.0/etcd-v0.3.0-linux-amd64.tar.gz
RUN tar -xzvf etcd-v0.3.0-linux-amd64.tar.gz
RUN cp etcd-v0.3.0-linux-amd64/etcd /usr/bin/
RUN rm -rf ./etcd-v0.3.0*    

# install supervisor
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

#install opalytils
ADD __init__.py /usr/local/src/opalytils/
ADD etcdutils.py /usr/local/src/opalytils/
ADD logutils.py /usr/local/src/opalytils/
ADD strconstants.py /usr/local/src/opalytils/

#add opalytils to python path via pth file
RUN touch /usr/local/lib/python2.7/dist-packages/opalytils.pth
RUN echo "/usr/local/src/" > /usr/local/lib/python2.7/dist-packages/opalytils.pth

