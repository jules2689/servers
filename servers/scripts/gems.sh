#!/bin/bash

set -ex

# Initialize Ruby
eval "$(/home/deploy/.rbenv/bin/rbenv init -)"

gem install rails -V --no-ri --no-rdoc
gem install bundler -V --no-ri --no-rdoc
