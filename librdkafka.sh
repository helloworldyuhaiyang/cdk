#!/bin/bash

source ./common.sh


echo "安装 librdkafka"
#安装poco 1.6.0 依赖
if [ $g_system == "centos" ]; then
        yum install make -y
        yum install openssl-devel -y
        yum install cyrus-sasl -y
        yum install cyrus-sasl-devel -y
elif [ $g_system == "ubuntu" ]; then
        apt-get install make  -y
        apt-get install openssl -y
        apt-get install libssl-dev -y
        apt-get install libsasl2-dev -y
        apt-get install python-dev -y
else
        echo "未识别系统"
fi

install_cpp "${g_current_path}/librdkafka" "kafka" "v0.11.0" "librdkafka"
