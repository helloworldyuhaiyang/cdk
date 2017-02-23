#!/bin/bash

#安装路径
g_dest_path=/opt/cdk
#g_dest_path=/opt/devbus

#当前变量
g_current_path=`pwd`



#判断系统类型
get_system()
{
	apt-get &> /dev/null
	if [ $? -eq 1 ]; then
		echo 'ubuntu'
		return
	fi
	
	yum &> /dev/null
	if [ $? -eq 1 ]; then
		echo 'centos'
		return
	fi

	echo 'unkonwn'
}

#全局变量，系统的名字　"ubuntu" "centos"
g_system=$(get_system)


#适用于　cmake ../ -DCMAKE_INSTALL_PREFIX=""  make  make install 安装的库
cmake_install_cpp()
{
    proPath=$1
    proName=$2
    version=$3
    subProName=$4
    srcPath=${proPath}/${version}/${subProName}
    dest_path=${g_dest_path}/${proName}/${version}
    # 检查是否已安装    
    if [ -x "${dest_path}" ]; then
		echo "===================================="
        echo "${proName} ${version} 已安装"
		echo "===================================="
        return 0
    fi
    
    # 检查安装源是否存在
    if [ ! -x "${srcPath}" ]; then
		echo "===================================="
        echo "${proName} ${version} 安装源不存在"
		echo "===================================="
        return 0
    fi
    
    # 开始安装
    cd ${srcPath} 
	#清空原目录
	if test -d "build" 
	then
		rm "build" -rf
	fi
	mkdir build
	cd build/
	cmake ../ -DCMAKE_INSTALL_PREFIX=${dest_path}
    make -j2
    make install
	echo "===================================="
    echo "${proName} ${version} 安装成功"
	echo "===================================="
}

#适用于　./configure --prefix=""  make  make install 安装的库
install_cpp()
{
    proPath=$1
    proName=$2
    version=$3
    subProName=$4
    srcPath=${proPath}/${version}/${subProName}
    dest_path=${g_dest_path}/${proName}/${version}

    # 检查是否已安装    
    if [ -x "${dest_path}" ]; then
		echo "===================================="
        echo "${proName} ${version} 已安装"
		echo "===================================="
        return 0
    fi
    
    # 检查安装源是否存在
    if [ ! -x "${srcPath}" ]; then
		echo "===================================="
        echo "${proName} ${version} 安装源不存在"
		echo "===================================="
        return 0
    fi
    
    # 开始安装
    cd ${srcPath} 
    ./configure --prefix=${dest_path}
	make clean
    make -j2
    make install
	echo "===================================="
    echo "${proName} ${version} 安装成功"
	echo "===================================="
}



