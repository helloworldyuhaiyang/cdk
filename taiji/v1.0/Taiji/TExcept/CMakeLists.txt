project(TExcept)

#设置此工程的源码
set(SRC Except.cpp)

#设置头文件的安装路径
install(FILES Except.h DESTINATION ${CMAKE_INSTALL_PREFIX}/include/Taiji/TExcept)
