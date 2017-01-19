#!/bin/bash
source ./common.sh

if [ $UID -ne 0 ]; then
    echo "用root权限执行!"
    echo "sudo $0"
    exit 1
fi



system=$(get_system)
echo "你的系统是: "$system

#安装基础工具
#安装poco 1.6.0 依赖
if [ $g_system == "centos" ]; then
	yum install make -y
	yum install cmake -y
elif [ $g_system == "ubuntu" ]; then
	apt-get install make  -y
	apt-get install cmake -y	
else
	echo "未识别系统"
fi

#安装 poco
./poco.sh

#安装 pcap
./pcap.sh

#安装 gtest
./gtest.sh

#安装rabbitmq-c
./rabbitmq.sh


#install_cpp "${currentPath}/poco" "poco" "v1.6.0" "poco-1.6.0-all"

#安装kafka
#install_cpp "${currentPath}/kafka" "kafka" "v0.9" "librdkafka-master"

#安装redis-client
#install_cpp "${currentPath}/redis-client" "redis-client" "v1.0" "redis-client"

#安装taiji
#install_cpp "${currentPath}/taiji" "taiji" "v1.0" "Taiji"


#安装snmp++
#if [ -x "${currentPath}/snmp++" ]; then
#    cd ${currentPath}/snmp++
#    ./snmpSet.sh
#fi
