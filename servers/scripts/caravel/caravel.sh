#!/bin/bash

set -e

# Install caravel
sudo pip install caravel

# Psycopg2 is required for Postgres
sudo pip install psycopg2

# Create an admin user. Change the password after
fabmanager create-admin --username caravel \
                        --firstname caravel \
                        --lastname caravel \
                        --email caravel@example.com \
                        --password password \
                        --app caravel

createdb caravel

# Caravel config
secret=`cat /dev/urandom | tr -cd 'a-f0-9' | head -c 64`

cat > /home/deploy/caravel_config.py << EOL
ROW_LIMIT = 5000
WEBSERVER_THREADS = 8
CARAVEL_WEBSERVER_PORT = 8088
SECRET_KEY = "\2\\$secret\1\2\e\y\y\h"
SQLALCHEMY_DATABASE_URI = 'postgresql:///caravel'
CSRF_ENABLED = True
EOL

export PYTHONPATH=$PYTHONPATH:/home/deploy/caravel_config.py
caravel db upgrade # Initialize the database
caravel init # Create default roles and permissions
