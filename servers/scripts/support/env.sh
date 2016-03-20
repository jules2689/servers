#!/bin/bash

set -ex

cat >> ~/.$(basename $SHELL)rc <<EOF
source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh
EOF

exec $SHELL