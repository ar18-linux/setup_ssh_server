#!/bin/bash

# Template version 2021-06-12.01
LD_PRELOAD_old="${LD_PRELOAD}"
LD_PRELOAD=
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
IFS=$'\n' shell_options=($(shopt -op))
set -o pipefail
set -eu
set -x
# Start of script

if [ -z "${ar18_helper_functions+x}" ]; then rm -rf "/tmp/helper_functions_$(logname)"; cd /tmp; git clone https://github.com/ar18-linux/helper_functions.git; mv "/tmp/helper_functions" "/tmp/helper_functions_$(logname)"; . "/tmp/helper_functions_$(logname)/helper_functions/helper_functions.sh"; cd "${script_dir}"; fi
obtain_sudo_password
pacman_install "openssh"

# Enable password authentication
echo "${ar18_sudo_password}" | sudo -Sk sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/g" "/etc/ssh/sshd_config"

# Enable the server
echo "${ar18_sudo_password}" | sudo -Sk systemctl enable sshd
echo "${ar18_sudo_password}" | sudo -Sk systemctl start sshd

# End of script
for option in "${shell_options[@]}"; do
  eval "${option}"
done
LD_PRELOAD="${LD_PRELOAD_old}"
return 0