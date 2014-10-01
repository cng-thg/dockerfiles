#############################################################################
# Dockerfile to build php-fpm image 
# Based on yesops/nginx image                                         
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

## Setting up supervisor
ADD fpm.conf /etc/supervisor/conf.d/php5-fpm.conf

## Setting up php5-fpm
#RUN cp -R /etc/php5/fpm /etc/php5/fpm.default
ADD fpm /etc/php5/fpm
ADD sites-available /etc/nginx/sites-available
ADD info.php /usr/share/nginx/html/info.php
ADD fpm.sh /opt/fpm.sh
RUN chmod +755 /opt/fpm.sh

## Expose ports 
EXPOSE 80 443

## Run supervisor
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
