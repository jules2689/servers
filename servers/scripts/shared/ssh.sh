#!/bin/bash

set -ex

# SSH
mkdir ~/.ssh
chmod 700 ~/.ssh
touch ~/.ssh/known_hosts

# Generate SSH Key
ssh-keygen -t rsa -b 4096 -C "deploy@packer-digitalocean.com" -f ~/.ssh/id_rsa -q -N ""

# Set Key Permissions
chmod 600 ~/.ssh/id_rsa
chmod 644 ~/.ssh/id_rsa.pub

echo "======= GENERATED SSH KEY"
cat ~/.ssh/id_rsa.pub

# Start Agent, Add Identity
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

# Don't worry about fingerprints for github.com
ssh-keygen -R github.com -f ~/.ssh/known_hosts
ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Add my SSH Keys
echo "Fetching SSH keys with $GITHUB_USER"
wget --no-check-certificate "https://github.com/$GITHUB_USER.keys" -O ~/.ssh/authorized_keys

# Fix any Permissions
chmod 600 ~/.ssh/authorized_keys
chown -R deploy ~/.ssh

sudo service ssh restart
