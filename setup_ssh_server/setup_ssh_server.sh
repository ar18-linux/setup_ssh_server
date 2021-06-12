#!/bin/bash

# Template version 2021-06-12.01
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
set -ex
LD_PRELOAD=

git clone https://github.com/ar18-linux/helper_functions.git
. "${script_dir}/helper_functions/helper_functions.sh"

obtain_sudo_password

pacman_install "openssh"

# End of script
set +ex