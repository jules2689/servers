#!/bin/bash

set -ex

# Add Kubernetes GPG Key
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee /etc/apt/sources.list.d/kubernetes.list > /dev/null

# Some recommended packages
sudo apt-get upgrade
sudo apt-get update
sudo apt-get install -y init-system-helpers apt-transport-https

# Install Kubernetes
sudo apt-get update
sudo apt-get install -y -f kubelet kubeadm kubectl kubernetes-cni
