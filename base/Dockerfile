#############################################################################
# Dockerfile to build base container image                                  #
# Based on Ubuntu                                                           #
#############################################################################


## Set the base image to Ubuntu
FROM ubuntu:trusty

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Set environment variables

## To allow automated installation of new packages, we set the debconf(7) frontend to noninteractive, which never prompts the user for choices on installation/configuration of packages:
## https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
ENV DEBIAN_FRONTEND noninteractive

## Prevent initramfs updates from trying to run grub and lilo.
## https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
## http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=594189
ENV INITRD No

## Set correct home directory for root
ENV HOME /root

# Workarounds to fix some bugs
############################################################################

## Temporarily disable dpkg fsync to make building faster.
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup

## Fix some issues with APT packages.
## See https://github.com/dotcloud/docker/issues/1024
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -sf /bin/true /sbin/initctl

## Replace the 'ischroot' tool to make it always return true.
## Prevent initscripts updates from breaking /dev/shm.
## https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
## https://bugs.launchpad.net/launchpad/+bug/974584
RUN dpkg-divert --local --rename --add /usr/bin/ischroot
RUN ln -sf /bin/true /usr/bin/ischroot

## policy-rc.d provides a method of controlling of the init scripts of
## all packages. By exiting with a 101, the init scripts for a package
## will not be ran, since 101 stands for action forbidden by policy:
RUN echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d
RUN chmod +x /usr/sbin/policy-rc.d

## Prevent APT from make a cache
RUN echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/no-cache


# Preparing the path
############################################################################

## Enable Ubuntu Multiverse.
# RUN sed -i 's/^#\s*\(deb.*multiverse\)$/\1/g' /etc/apt/sources.list

## Update repos and upgrade system
RUN apt-get -qq update
RUN apt-get -qqy upgrade

## Install English language and set Locale
RUN apt-get -qqy install language-pack-en
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
