#############################################################################
# Dockerfile to build a VCS image
# Based on yesops/ubuntu:trusty image
#############################################################################


## Set the base image to Ubuntu Trusty
FROM yesops/ubuntu:trusty

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Update repos and install packages
## Install both git and curl
RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
  curl \
  ca-certificates \
  git
