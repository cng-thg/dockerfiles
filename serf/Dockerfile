#############################################################################
# Dockerfile to build an image with serf (serfdom.io) inside
# Based on yesops/base image                                         
#############################################################################


## Set the base image
FROM yesops/base

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Update repos and install cURL, unzip and supervisor
RUN apt-get -qq update && apt-get install --no-install-recommends -y \
  curl \
  unzip \
  supervisor

## Getting serf
RUN curl -LOk https://dl.bintray.com/mitchellh/serf/0.6.3_linux_amd64.zip
RUN unzip 0.6.3_linux_amd64.zip && \
  rm 0.6.3_linux_amd64.zip && \
  mv serf /usr/bin

## Setting up Serf
ENV SERF_ROLE serf
ADD serf.sh /opt/serf.sh
RUN chmod +755 /opt/serf.sh

## Setting up supervisor
ADD serf.conf /etc/supervisor/conf.d/serf.conf

## Define mountable directories.
VOLUME ["/var/log/supervisor"]

## Expose ports
EXPOSE 7946 7373

## Run supervisor
CMD ["supervisord", "-n" , "-c", "/etc/supervisor/supervisord.conf"]
