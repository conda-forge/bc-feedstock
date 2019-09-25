#!/bin/bash

set -ex

# configure
./configure \
	--prefix=${PREFIX}

# build
make -j ${CPU_COUNT}

# check
bash ./verify_checklib_results.sh

# install
make install
