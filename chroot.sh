#!/bin/bash

CHROOT='/var/chroot'
mkdir $CHROOT

for i in $( ldd $* | grep -v dynamic | cut -d " " -f 3 | sed 's/://' | sort | uniq )
  do
    cp --parents $i $CHROOT
  done
  
cp --parents /lib64/ld-linux-x86-64.so.2 /$CHROOT

echo "Successful! Execute: chroot $CHROOT"
