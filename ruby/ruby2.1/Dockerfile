#############################################################################
# Dockerfile to build ruby 2.1 image
# Based on yesops/git:trusty image
#############################################################################


## Set the base image to git:trusty
FROM yesops/git:trusty

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Your settings go here:

## Add repository
RUN echo 'deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main' \
    > /etc/apt/sources.list.d/brightbox-ruby-ng.list \
    && echo 'deb-src http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main' \
    >> /etc/apt/sources.list.d/brightbox-ruby-ng.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6

## Update repository and install ruby 2.1
RUN apt-get update \
    && apt-get install --no-install-recommends -qqy \
    ruby2.1 \
    ruby2.1-dev

## Set gem to install no docs
RUN echo 'gem: --no-ri --no-rdoc' > /etc/gemrc

## Instal Bundler
RUN gem install bundler
