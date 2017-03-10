#!/bin/bash

set -ex

apt-get -y autoremove
apt-get -y clean

# Clean up tmp
rm -rf /tmp/*

# Removing leftover leases and persistent rules
rm -rf /var/lib/dhcp/*
