#!/bin/bash
#########################################################################
# File Name: libevent.sh
# Author: yhy
# Created Time: 2017年05月27日 星期六 17时40分14秒
#########################################################################
source ./common.sh


echo "安装 libevent"


#安装libevent 依赖
#暂时没有发现依赖

install_cpp "${g_current_path}/libevent" "libevent" "v2.0.20" "libevent-2.0.20-stable"
