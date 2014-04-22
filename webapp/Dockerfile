# webapp
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
RUN apt-get install -y netcat

# install etcd
ADD etcd /usr/bin/etcd

# install supervisor
RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# install production code
ADD webapp.py /usr/local/src/webapp/
ADD startFlask.sh /usr/local/src/webapp/
RUN chmod +x /usr/local/src/webapp/startFlask.sh

# fire up supervisor on boot
CMD ["/usr/bin/supervisord"]