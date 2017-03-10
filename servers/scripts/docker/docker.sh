#!/bin/bash

set -ex

# Recommended Packages from Docker Overlords
sudo apt-get -y  install linux-image-extra-$(uname -r) linux-image-extra-virtual
sudo apt-get -y  install apt-transport-https ca-certificates curl software-properties-common

# GPG Key for Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify the Fingerprint
apt-key fingerprint 0EBFCD88 # Output for debugging if it fails
apt-key fingerprint 0EBFCD88 | grep -q '9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88'

# Set up stable repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Install Docker
sudo apt-get update
sudo apt-get install -y docker.io
