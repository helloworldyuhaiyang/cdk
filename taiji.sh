#!/bin/bash

source ./common.sh




cmake_install_cpp "${g_current_path}/taiji" "taiji" "v1.0" "Taiji" "-DPOCO_PATH=/opt/cdk/poco/v1.6.0"
