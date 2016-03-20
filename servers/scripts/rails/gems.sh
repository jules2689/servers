#!/bin/bash

set -ex

source /tmp/env.sh

chruby ruby-2.3.0

gem install rails -V --no-ri --no-rdoc
gem install bundler -V --no-ri --no-rdoc
