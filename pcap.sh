#!/bin/bash

source ./common.sh


#依赖安装
if [ $g_system == "centos" ]; then
	yum install flex -y
	yum install bison -y
elif [ $g_system == "ubuntu" ]; then
	sudo apt-get install flex -y
	sudo apt-get install bison -y
else
	echo "未识别系统"
fi

#编译安装 pcap

install_cpp "${g_current_path}/pcap" "pcap" "v1.8.1" "libpcap-1.8.1"
