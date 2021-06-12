#!/bin/bash

# Template version 2021-06-12.01
LD_PRELOAD=
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
IFS=$'\n' shell_options=($(shopt -op))
set -o pipefail
set -exu
# Start of script

. "${script_dir}/vars"
if [ -z "${ar18_helper_functions+x}" ]; then rm -rf "/tmp/helper_functions_$(logname)"; cd /tmp; git clone https://github.com/ar18-linux/helper_functions.git; mv "/tmp/helper_functions" "/tmp/helper_functions_$(logname)" . "/tmp/helper_functions_$(logname)/helper_functions/helper_functions.sh"; cd "${script_dir}"; fi

obtain_sudo_password

ar18_install "${install_dir}" "${module_name}" "${script_dir}"

# End of script
for option in "${shell_options[@]}"; do
  eval "${option}"
done
