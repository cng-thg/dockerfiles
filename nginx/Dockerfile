#############################################################################
# Dockerfile to build nginx image 
# Based on yesops/serf image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/serf

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Update repos and add nginx ppa
RUN apt-get -qq update && \
apt-get install -y software-properties-common && \
add-apt-repository ppa:nginx/stable -y

## Update repos and install nginx
RUN apt-get -qq update && apt-get install --no-install-recommends -y \
  nginx

## Setting up supervisor
ADD nginx.conf /etc/supervisor/conf.d/nginx.conf
ADD nginx.sh /opt/nginx.sh
RUN chmod +755 /opt/nginx.sh

# tell Nginx to stay foregrounded
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Define mountable directories.
VOLUME ["/etc/nginx", "/var/log/nginx", "/etc/supervisor"]

## Expose ports 
EXPOSE 80 443

## Run supervisor
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf 
"]
