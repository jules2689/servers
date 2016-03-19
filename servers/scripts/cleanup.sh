#!/bin/bash
set -ex

apt-get -y autoremove
apt-get -y clean

# Clean up tmp
rm -rf /tmp/*

# Removing leftover leases and persistent rules
rm /var/lib/dhcp/*

# Zero out the free space to save space in the final image:
dd if=/dev/zero of=/EMPTY bs=1M || true
rm -f /EMPTY
dd if=/dev/zero of=/boot/EMPTY bs=1M || true
rm -f /boot/EMPTY
sync
