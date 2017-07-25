#!/bin/bash

source ./common.sh


echo "安装 poco"


#安装poco 1.6.0 依赖
if [ $g_system == "centos" ]; then
	yum install make -y
	yum install openssl-devel -y
	yum install unixODBC-devel -y
	yum install mysql-devel -y
	install_cpp "${g_current_path}/poco" "poco" "v1.6.0" "poco-1.6.0-all"
elif [ $g_system == "ubuntu" ]; then
	apt-get install make  -y
	apt-get install openssl -y
	apt-get install libssl-dev -y
	apt-get install libssl1.0-dev -y #兼容 deepin linux deepinlinux 默认版本 ssl 编译 poco 通不过
	apt-get install unixodbc -y
	apt-get install unixodbc-dev -y
	apt-get install libmysqlclient* -y
	install_cpp "${g_current_path}/poco" "poco" "v1.6.0" "poco-1.6.0-all"
elif [ $g_system == "macos" ]; then
	echo "请先使用普通用户安装 brew,cmake,openssl 基本工具"
	echo "安装完毕继续请输入 yes"
	read result
	if [ $result != "yes" ]
	then
		exit
	else
		echo "继续安装 poco"
	fi

	cmake_install_cpp "${g_current_path}/poco" "poco" "v1.6.0" "poco-1.6.0-all"
else
	echo "未识别系统"
fi


