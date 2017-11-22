#!/bin/bash
source ./common.sh

if [ $UID -ne 0 ]; then
    echo "用root权限执行!"
    echo "sudo $0"
    exit 1
fi



echo "你的系统是: "$g_system

#安装基础工具
#安装poco 1.6.0 依赖
if [ $g_system == "centos" ]; then
	yum install make -y
	yum install cmake -y
elif [ $g_system == "ubuntu" ]; then
	apt-get install make  -y
	apt-get install cmake -y	
elif [ $g_system == "macos" ]; then
	echo "mac os 商处于调试阶段"
else
	echo "未识别系统"
fi

#安装 poco
#./poco.sh
#安装 taiji,安装 taiji 必须安装 poco
./taiji.sh
#安装 pcap
#./pcap.sh

#安装 gtest
#./gtest.sh

#安装rabbitmq-c
#./rabbitmq.sh


#安装snmp++
#if [ -x "${currentPath}/snmp++" ]; then
 #   cd ${currentPath}/snmp++
  #  ./snmpSet.sh
#fi

