#!/bin/bash

source ./common.sh


echo "安装 poco"


#安装poco 1.6.0 依赖
if [ $g_system == "centos" ]; then
	yum install make -y
	yum install g++ -y
	yum install openssl-devel -y
	yum install unixODBC-devel -y
	yum install mysql-devel -y
elif [ $g_system == "ubuntu" ]; then
	apt-get install make  -y
	apt-get install g++  -y
	apt-get install openssl -y
	apt-get install libssl-dev -y
	apt-get install unixodbc -y
	apt-get install unixodbc-dev -y
	apt-get install libmysqlclient* -y
else
	echo "未识别系统"
fi


install_cpp "${g_current_path}/poco" "poco" "v1.6.0" "poco-1.6.0-all"
