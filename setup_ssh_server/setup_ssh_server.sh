#!/bin/bash

# Template version 2021-06-12.01
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
set -ex
LD_PRELOAD=

if [ -z "${ar18_helper_functions+x}" ]; then rm -rf "/tmp/helper_functions"; cd /tmp; git clone https://github.com/ar18-linux/helper_functions.git; . "/tmp/helper_functions/helper_functions/helper_functions.sh"; cd "${script_dir}"; fi
obtain_sudo_password

pacman_install "openssh"

# Enable password authentication
echo "${ar18_sudo_password}" | sudo -Sk sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" "/etc/ssh/sshd_config"

# Enable the server
echo "${ar18_sudo_password}" | sudo -Sk systemctl enable sshd

# End of script
set +ex