#!/bin/bash

source ./common.sh


echo "安装 librdkafka"


install_cpp "${g_current_path}/librdkafka" "kafka" "v0.11.0" "librdkafka"
