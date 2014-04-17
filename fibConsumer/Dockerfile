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

ADD fibConsumer.py /usr/local/src/fibConsumer/fibConsumer.py

# Launch fibConsumer
CMD ["python", "/usr/local/src/fibConsumer/fibConsumer.py"]

# run fibConsumer as the daemon user
USER daemon

# expose fibConsumer port
EXPOSE 5000
