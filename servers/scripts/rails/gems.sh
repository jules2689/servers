#!/bin/bash

set -ex

source /tmp/ruby_env.sh

gem install rails -V --no-ri --no-rdoc
gem install bundler -V --no-ri --no-rdoc
