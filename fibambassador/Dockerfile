# fibambassador
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

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD serf_member_join.sh /usr/local/src/fibambassador/
ADD serf_member_leave.sh /usr/local/src/fibambassador/
RUN chmod +x /usr/local/src/fibambassador/serf_member_join.sh
RUN chmod +x /usr/local/src/fibambassador/serf_member_leave.sh

CMD ["/usr/bin/supervisord"]