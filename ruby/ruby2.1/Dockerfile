#############################################################################
# Dockerfile to build python 2.7 image
# Based on yesops/base image
#############################################################################


## Set the base image to Ubuntu
FROM yesops/git

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Your settings go here:

## Update repos and install packages
## Adding Brightbox PPA and Update repos
RUN apt-get install --no-install-recommends -qqy software-properties-common
RUN apt-add-repository -y ppa:brightbox/ruby-ng
RUN apt-get -qq update

## Install ruby 2.1
RUN apt-get install --no-install-recommends -qqy ruby2.1

## Install ruby-dev
RUN apt-get install --no-install-recommends -qqy ruby2.1-dev

## Set gem to install no docs
RUN echo 'gem: --no-ri --no-rdoc' > /etc/gemrc

## Instal Bundler
RUN gem install bundler
