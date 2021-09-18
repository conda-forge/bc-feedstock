#!/bin/bash

set -ex

# configure
aclocal
automake
declare -a configure_args
configure_args+=("--prefix=${PREFIX}")
configure_args+=("CC_FOR_BUILD=${CC_FOR_BUILD:-${CC}}")
./configure "${configure_args[@]}"

# build
make "-j${CPU_COUNT}"

# check
if [[ "$CONDA_BUILD_CROSS_COMPILATION" != "1" ]]; then
    bash ./verify_checklib_results.sh
fi

# install
make install
