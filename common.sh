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


#适用于　cmake ../ -DCMAKE_INSTALL_PREFIX="/xxx/xxxx"  make  make install 安装的库
#CMAKE_INSTALL_PREFIX 已经按照 cdk 的管理包规则设定,不能改写。其他的要传的变量可以通过一个字符串传进去
#例如:
#cmake_install_cpp "${g_current_path}/rabbitmq-c" "rabbitmq-c" "v0.8.1" "rabbitmq-c" "-DCMAKE_INSTALL_LIBDIR='lib' -DXXX=abc"

cmake_install_cpp()
{
    proPath=$1
    proName=$2
    version=$3
    subProName=$4
    cmake_args=$5
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
	cmake ../ -DCMAKE_INSTALL_PREFIX=${dest_path} ${cmake_args}
    	make -j2
    	make install
	echo "===================================="
    echo "${proName} ${version} 安装成功"
	echo "===================================="
}

#适用于　./configure --prefix="xxx"  make  make install 安装的库
#--prefix 已近按照 cdk 管理包写好了，不能进行更改
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
