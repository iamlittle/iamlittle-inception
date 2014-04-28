# servicelocator
#
# VERSION       1

# use the base image 
FROM iamlittle/base

MAINTAINER Aaron Little alittle@opalytics.com

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD startEtcd.sh /usr/local/src/servicelocator/
RUN chmod +x /usr/local/src/servicelocator/startEtcd.sh

CMD ["/usr/bin/supervisord"]