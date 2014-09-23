#############################################################################
# Dockerfile to build an image with essential build packages
# Based on yesops/base image                                         
#############################################################################


## Set the base image to Ubuntu
FROM yesops/base

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Update repos and install packages
## These packages are required to build python and ruby
RUN apt-get -qq update && apt-get install --no-install-recommends -y \
  autoconf \
  build-essential \
  libbz2-dev \
  libffi-dev \
  libncurses-dev \
  libreadline-dev \
  libssl-dev \
  libyaml-dev \
  zlib1g-dev

## Databases dependencies: MySQL, Postgres, SQLite
RUN apt-get install --no-install-recommends -y \
  libmysqlclient-dev \
  libpq-dev \
  libsqlite3-dev
                                
## Imaging dependencies
#RUN apt-get install --no-install-recommends -y \
#  imagemagick \
#  libjpeg-dev \
#  libtiff5-dev
#  libmagickwand-dev
#libmagickcore-dev \
# liblcms2-dev \                              
#  libwebp-dev 
#  libfreetype6-dev \ 
#  libxml2-dev \
#  libxslt-dev \
#libglib2.0-dev \
#libcurl4-openssl-dev \
#libevent-dev \
