#############################################################################
# Dockerfile to build php-fpm image 
# Based on yesops/serf image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/nginx

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Install php5
RUN apt-get -qq update && apt-get install --no-install-recommends -y \
  php5-cli \
  php5-curl \ 
  php5-dev \
  php5-fpm \
  php5-gd \
  php5-imap \
  php5-mcrypt \
  php5-mysqlnd \ 
  php-pear \
  php5-xmlrpc
