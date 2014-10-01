#############################################################################
# Dockerfile to build nginx image 
# Based on yesops/serf image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/serf

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Update repos and install software-properties-common
RUN apt-get -qq update && \
apt-get install -y software-properties-common

## Adds Nginx ppa
RUN add-apt-repository ppa:nginx/stable -y

## Update repos and install nginx
RUN apt-get -qq update && apt-get install --no-install-recommends -y \
  nginx

## Setting up Serf
ENV SERF_ROLE web

## Setting up supervisor
ADD nginx-supervisor.conf /etc/supervisor/conf.d/nginx.conf

## Setting up nginx
ADD nginx.conf /etc/nginx/nginx.conf
ADD nginx.sh /opt/nginx.sh
RUN chmod +755 /opt/nginx.sh

## Define mountable directories.
VOLUME ["/var/log/nginx"]

## Expose ports 
EXPOSE 80 443

## Run supervisor
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
