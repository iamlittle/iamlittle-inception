# webapp
#
# VERSION       1

# use the flask base image 
FROM iamlittle/base

MAINTAINER Aaron Little alittle@opalytics.com

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# install production code
ADD webapp.py /usr/local/src/webapp/

# fire up supervisor on boot
CMD ["/usr/bin/supervisord"]