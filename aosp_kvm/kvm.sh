#!/bin/sh

if [ ! -e cache.img ] ; then
   dd if=/dev/zero of=cache.img bs=1M count=200
fi

kvm \
-hda system.img \
-hdb userdata.img \
-hdc cache.img \
-kernel kernel \
-initrd ramdisk.img \
-append "qemu=1 console=ttyS0 androidboot.hardware=aosp_kvm android.checkjni=1 ndns=1 vga=788 androidboot.console=ttyS0" \
-serial /dev/tty \
-net nic,model=e1000 \
-m 2048 && stty sane
