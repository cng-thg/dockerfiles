#!/bin/bash

# ---------------------------------------------------------------------------
#
# mkvoid.sh   : Create a minimal Ubuntu rootfs image
#
# Usage       : chmod +x ./mkubuntu.sh && ./mkubuntu.sh
#
# Site        : github.com/cng-thg/
# Author      : Thiago Cangussu <cng.thg@gmail.com>
# Maintainer  : Thiago Cangussu <cng.thg@gmail.com>
# Date        : 20150626
# License     : BSD
#
# ---------------------------------------------------------------------------


set -e
[ $TRACE ] && set -x

## Variables
ARCH=$(uname -m)
BUILD=${BUILD:-1}
SAVE=${SAVE:-1}
TMPDIR=${TMPDIR:-/tmp/ubuntu}
ROOTFS=${ROOTFS:-$TMPDIR/rootfs}
RELEASE=trusty


## Create temporary folders
echo "Running mktmp"

mkdir -p $ROOTFS
trap "rm -rf $TMPDIR $ROOTFS" EXIT TERM INT


## Debootstrapping environment
echo "Running debootstrap"

debootstrap --variant=minbase $RELEASE $ROOTFS


## Cleaning unnecessary packages
echo "Cleanning rootfs"

chroot $ROOTFS /bin/bash -x <<'EOF' 
  dpkg --clear-selections
  echo apt install |dpkg --set-selections
  SUDO_FORCE_REMOVE=yes 
  DEBIAN_FRONTEND=noninteractive 
  apt-get --purge -y dselect-upgrade
  dpkg-query -Wf '${db:Status-Abbrev}\t${binary:Package}\n' | grep '^.i' | awk -F'\t' '{print $2 " install"}' | dpkg --set-selections
  rm -r /var/cache/apt
EOF

## Saving tarball
echo "Creating tarball"
tar --numeric-owner -C $ROOTFS -c . | xz > rootfs.tar.xz
