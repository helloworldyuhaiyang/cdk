#!/bin/bash
#########################################################################
# File Name: rabbitmq.sh
# Author: yhy
# Created Time: 2017年01月06日 星期五 14时55分13秒
#########################################################################
source ./common.sh

cmake_install_cpp "${g_current_path}/rabbitmq-c" "rabbitmq-c" "v0.8.1" "rabbitmq-c" "-DCMAKE_INSTALL_LIBDIR='lib'"

