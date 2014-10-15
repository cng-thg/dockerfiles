#############################################################################
# Dockerfile to build nodejs image
# Based on yesops/git image
#############################################################################


## Set the base image yesops/git
FROM yesops/git

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Your settings go here:

## Update repos and install packages
## Adding Chris Lea PPA and Update repos
RUN apt-get install --no-install-recommends -qqy software-properties-common
RUN add-apt-repository -y ppa:chris-lea/node.js
RUN apt-get update

## Install nodejs
RUN apt-get install --no-install-recommends -qqy nodejs
