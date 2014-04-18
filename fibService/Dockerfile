# fibService
#
# VERSION       1

# use the flask base image 
FROM iamlittle/flask

MAINTAINER Aaron Little alittle@opalytics.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

RUN mkdir /usr/local/src/fibservice
WORKDIR /usr/local/src/fibservice

ADD fibService.py /usr/local/src/fibservice/fibService.py
ADD opalytics_www_utils/ /usr/local/src/fibservice/opalytics_www_utils/


CMD ["python", "/usr/local/src/fibservice/fibService.py"]
