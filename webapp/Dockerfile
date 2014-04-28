# webapp
#
# VERSION       1

# use the flask base image 
FROM iamlittle/base

MAINTAINER Aaron Little alittle@opalytics.com

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# install production code
ADD webapp.py /usr/local/src/webapp/
ADD startFlask.sh /usr/local/src/webapp/
RUN chmod +x /usr/local/src/webapp/startFlask.sh

# fire up supervisor on boot
CMD ["/usr/bin/supervisord"]