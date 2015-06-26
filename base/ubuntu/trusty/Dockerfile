#############################################################################
# Dockerfile to build micro images from scratch 
# Based on a custom Ubuntu debootstrap
#############################################################################


## Set the base image to scratch
FROM scratch

## File Author / Maintainer
MAINTAINER Thiago Cangussu <cng.thg@gmail.com>

## Add rootfs
ADD rootfs.tar.xz /

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

## 1. Temporarily disable dpkg fsync to make building faster.
## 2. Fix some issues with APT packages.
## See https://github.com/dotcloud/docker/issues/1024
## 3. Replace the 'ischroot' tool to make it always return true.
## Prevent initscripts updates from breaking /dev/shm.
## https://journal.paul.querna.org/articles/2013/10/15/docker-ubuntu-on-rackspace/
## https://bugs.launchpad.net/launchpad/+bug/974584
## 4. policy-rc.d provides a method of controlling of the init scripts of
## all packages. By exiting with a 101, the init scripts for a package
## will not be ran, since 101 stands for action forbidden by policy:
## 5. Prevent APT from make a cache
RUN echo "force-unsafe-io" > /etc/dpkg/dpkg.cfg.d/02apt-speedup \
    && dpkg-divert --local --rename --add /sbin/initctl && \
    ln -sf /bin/true /sbin/initctl \
    && dpkg-divert --local --rename --add /usr/bin/ischroot && \
    ln -sf /bin/true /usr/bin/ischroot \
    && echo '#!/bin/sh\nexit 101' > /usr/sbin/policy-rc.d && \
    chmod +x /usr/sbin/policy-rc.d \
    && echo "Acquire::http {No-Cache=True;};" > /etc/apt/apt.conf.d/70no-cache
