# fibService
#
# VERSION       1

# use the flask base image 
FROM iamlittle/flask

MAINTAINER Aaron Little alittle@opalytics.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y curl
RUN apt-get install -y unzip
RUN apt-get install -y wget

RUN wget https://dl.bintray.com/mitchellh/serf/0.5.0_linux_amd64.zip
RUN unzip 0.5.0_linux_amd64.zip
RUN mv ./serf /usr/bin/serf
RUN chmod +x /usr/bin/serf

RUN apt-get install -y supervisor
RUN mkdir -p /var/log/supervisor

RUN mkdir /usr/local/src/fibservice
WORKDIR /usr/local/src/fibservice

ADD fibservice.py /usr/local/src/fibservice/
ADD startFlask.sh /usr/local/src/fibservice/
ADD opalytics_www_utils/ /usr/local/src/fibservice/opalytics_www_utils/
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod +x /usr/local/src/fibservice/startFlask.sh

CMD ["/usr/bin/supervisord"]
