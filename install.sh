#!/bin/bash

# Template version 2021-06-12.01
LD_PRELOAD=
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
#IFS=$'\n' shell_options=($(shopt -op))
set -ex
#set -u
#set -o pipefail
# Start of script

. "${script_dir}/vars"
if [ -z "${ar18_helper_functions+x}" ]; then rm -rf "/tmp/helper_functions"; cd /tmp; git clone https://github.com/ar18-linux/helper_functions.git; . "/tmp/helper_functions/helper_functions/helper_functions.sh"; cd "${script_dir}"; fi

obtain_sudo_password

ar18_install "${install_dir}" "${module_name}" "${script_dir}"

# End of script
for option in "${shell_options[@]}"; do
  eval "${option}"
done
