cmake_minimum_required(VERSION 2.8)
project(Taiji)


###########################获取系统##########################

############PLATEFORM=Linux/Windows/FreeBSD/MacOS###################

if (CMAKE_SYSTEM_NAME MATCHES "Linux")
    set(PLATEFORM Linux)
elseif (CMAKE_SYSTEM_NAME MATCHES "Windows")
    set(PLATEFORM Windows)
elseif (CMAKE_SYSTEM_NAME MATCHES "FreeBSD")
    set(PLATEFORM FreeBSD)
elseif (APPLE)
    set(PLATEFORM MacOS)
else ()
    message(FATAL_ERROR "other platform: ${CMAKE_SYSTEM_NAME}")
endif (CMAKE_SYSTEM_NAME MATCHES "Linux")

message(STATUS "============current platform: ${PLATEFORM}\n")

###########################设置依赖##########################
#查找依赖头文件
find_path(POCO_INCLUDE_PATH
        NAMES Poco/Poco.h
        PATHS "${POCO_PATH}/include"
        )

if (NOT POCO_INCLUDE_PATH)
    message(FATAL_ERROR "can not find poco headfile")
endif (NOT POCO_INCLUDE_PATH)



#查找依赖库路径
find_library(POCO_LIBRARY_PATH
        NAMES PocoFoundation
        PATHS "${POCO_PATH}/lib"
        )

#如果找不到想要的库则终止退出
if (NOT POCO_LIBRARY_PATH)
    message(FATAL_ERROR "can not find poco library, please set POCO_PATH=\"path of poco\"")
endif (NOT POCO_LIBRARY_PATH)

#去掉文件名只留路径名
set(POCO_LIBRARY_PATH ${POCO_PATH}/lib)

message(STATUS "============POCO_INCLUDE_PATH:${POCO_INCLUDE_PATH}")
message(STATUS "============POCO_LIBRARY_PATH:${POCO_LIBRARY_PATH}")

#头文件查找路径
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/../" "${POCO_INCLUDE_PATH}")
#库查找路径
link_directories("${POCO_LIBRARY_PATH}")

#苹果系统开启 rpath 特性
if (PLATEFORM STREQUAL MacOS)
    set(CMAKE_MACOSX_RPATH 1)
endif (PLATEFORM STREQUAL MacOS)


############################设置生成规则############################
#c++11 支持
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if (COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif (COMPILER_SUPPORTS_CXX0X)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else ()
    message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif ()


ADD_SUBDIRECTORY(TExcept)
ADD_SUBDIRECTORY(TRedis)
ADD_SUBDIRECTORY(TUtil)
