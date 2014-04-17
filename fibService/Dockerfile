# fibService
#
# VERSION       1

# use the flask base image 
FROM iamlittle/flask

MAINTAINER Aaron Little alittle@opalytics.com

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

ADD fibService.py /usr/local/src/fibService/fibService.py
ADD opalytics_www_utils/ /usr/local/src/fibService/opalytics_www_utils/

# Launch fibService
CMD ["python", "/usr/local/src/fibService/fibService.py"]

# run fibService as the daemon user
USER daemon

# expose fibService port
EXPOSE 5001
