#!/bin/bash

set -ex

# Install some necessary dependencies
sudo apt-get install -y git-core libssl-dev libreadline-dev zlib1g-dev make

# Install rbenv
git clone https://github.com/rbenv/rbenv.git /home/deploy/.rbenv
cd /home/deploy/.rbenv && src/configure && make -C src

# Install ruby-build to get the `rbenv install` command
git clone https://github.com/rbenv/ruby-build.git /home/deploy/.rbenv/plugins/ruby-build

# Install Ruby v2.2.3
/home/deploy/.rbenv/bin/rbenv install -v 2.2.3
/home/deploy/.rbenv/bin/rbenv global 2.2.3

echo 'eval "$(/home/deploy/.rbenv/bin/rbenv init -)"' >> /home/deploy/.profile
