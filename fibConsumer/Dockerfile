# fibConsumer
#
# VERSION       1

# use the flask base image 
FROM iamlittle/flask

MAINTAINER Aaron Little alittle@opalytics.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y curl

RUN mkdir /usr/local/src/fibconsumer
WORKDIR /usr/local/src/fibconsumer
ADD fibConsumer.py /usr/local/src/fibconsumer/

CMD ["python", "/usr/local/src/fibconsumer/fibConsumer.py"]