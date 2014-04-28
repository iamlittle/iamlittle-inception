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
RUN apt-get install -y curl
RUN apt-get install -y nmap
RUN apt-get install -y netstat-nat

#install requests
RUN apt-get install -y python-pip
RUN pip install requests

# install etcd
ADD etcd /usr/bin/etcd

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

