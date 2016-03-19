#!/bin/bash

set -ex

# Install Postgres
sudo apt-get -y install postgresql postgresql-contrib libpq-dev

# User
sudo -u postgres createuser -s deploy