#!/bin/bash

set -ex

export PATH=/usr/bin:/bin:/usr/sbin:/sbin
sudo apt-get clean # Issue here for whatever reason
sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y install linux-headers-$(uname -r) build-essential
