#############################################################################
# Dockerfile to build an image with essential build packages
# Based on yesops/base image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/base

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Update repos and install packages
RUN apt-get -qq update && apt-get install --no-install-recommends -qqy \
                                autoconf \
                                build-essential \
                                imagemagick \
                                libbz2-dev \
                                libcurl4-openssl-dev \
                                libevent-dev \
                                libffi-dev \
                                libglib2.0-dev \
                                libjpeg-dev \
                                libmagickcore-dev \
                                libmagickwand-dev \
                                libmysqlclient-dev \
                                libncurses-dev
                                libpq-dev \
                                libreadline-dev \
                                libssl-dev \
                                libxml2-dev \
                                libxslt-dev \
                                libyaml-dev \
                                zlib1g-dev \




