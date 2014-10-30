#############################################################################
# Dockerfile to build nodejs image
# Based on yesops/git:trusty image
#############################################################################


## Set the base image yesops/git
FROM yesops/git:trusty

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Your settings go here:

## To apt get packages from https
RUN apt-get install -y apt-transport-https

## Adding Nodesource repository
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - \
    && echo 'deb https://deb.nodesource.com/node trusty main' > /etc/apt/sources.list.d/nodesource.list \
    && apt-get update \
    && apt-get install --no-install-recommends -y nodejs
