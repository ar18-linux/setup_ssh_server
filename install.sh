#!/bin/bash

# Template version 2021-06-12.01
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
set -ex
LD_PRELOAD=
# Start of script

. "${script_dir}/vars"
if [ -z "${ar18_helper_functions+x}" ]; then rm -rf "/tmp/helper_functions"; cd /tmp; git clone https://github.com/ar18-linux/helper_functions.git; . "/tmp/helper_functions/helper_functions/helper_functions.sh"; cd "${script_dir}"; fi

obtain_sudo_password

ar18_install "${install_dir}" "${module_name}" "${script_dir}"

# End of script
set +ex
