#!/bin/bash

set -ex

addgroup deploy

# Add User
useradd deploy --create-home --shell /bin/bash -g deploy

# Add to Sudo
gpasswd -a deploy sudo
sed -i -e '/Defaults\s\+env_reset/a Defaults\texempt_group=sudo' /etc/sudoers
sed -i -e 's/%sudo  ALL=(ALL:ALL) ALL/%sudo  ALL=NOPASSWD:ALL/g' /etc/sudoers

# Don't let root login
cat /etc/ssh/sshd_config | sed 's/PermitRootLogin yes/PermitRootLogin no/g' > /etc/ssh/tmp_sshd_config
rm /etc/ssh/sshd_config
mv /etc/ssh/tmp_sshd_config /etc/ssh/sshd_config
