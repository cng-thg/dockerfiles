#############################################################################
# Dockerfile to build wordpress image 
# Based on yesops/php5-nginx                                       
#############################################################################


## Set the base image to php5-nginx
FROM yesops/php5-nginx


## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>


## Set srv/www as workdir
WORKDIR /srv/www

## Get WP
RUN curl -LOk https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    rm latest.zip 

## Set serf role
ENV SERF_ROLE wordpress

## Setting up supervisor
ADD wp.conf /etc/supervisor/conf.d/wp.conf

## Export DB_HOST, get ip from serf
ADD wp.sh /opt/wp.sh
RUN chmod +x /opt/wp.sh

## Set wordpress config and permissions
ADD wp-config.php /srv/www/wordpress/wp-config.php
RUN chown -R www-data:www-data wordpress

## Set wordpress site on nginx
ADD wordpress /etc/nginx/sites-available/wordpress
RUN rm /etc/nginx/sites-enabled/default
RUN ln -s /etc/nginx/sites-available/wordpress /etc/nginx/sites-enabled/

## Expose ports 
EXPOSE 80 443

## Run supervisor
CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
