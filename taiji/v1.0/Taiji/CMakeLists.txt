cmake_minimum_required(VERSION 2.8)
project(Taiji)




###########################设置依赖##########################
#查找依赖头文件
find_path(POCO_INCLUDE_PATH
        NAMES Poco/Poco.h
        PATHS "${POCO_PATH}/include"
        )

if( NOT POCO_INCLUDE_PATH)
    message( FATAL_ERROR "can not find poco headfile" )
endif(NOT POCO_INCLUDE_PATH)

#查找依赖库路径
find_path(POCO_LIBRARY_PATH
        NAMES libPocoFoundation.so
        PATHS "${POCO_PATH}/lib"
        )

if( NOT POCO_LIBRARY_PATH)
    message( FATAL_ERROR "can not find poco library" )
endif(NOT POCO_LIBRARY_PATH)

message( STATUS "============POCO_INCLUDE_PATH:${POCO_INCLUDE_PATH}")
message( STATUS "============POCO_LIBRARY_PATH:${POCO_LIBRARY_PATH}")

#头文件查找路径
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/../" "${POCO_INCLUDE_PATH}")
#库查找路径
link_directories("${POCO_LIBRARY_PATH}")







############################设置生成规则############################
#c++11 支持
include(CheckCXXCompilerFlag)
CHECK_CXX_COMPILER_FLAG("-std=c++11" COMPILER_SUPPORTS_CXX11)
CHECK_CXX_COMPILER_FLAG("-std=c++0x" COMPILER_SUPPORTS_CXX0X)
if(COMPILER_SUPPORTS_CXX11)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
elseif(COMPILER_SUPPORTS_CXX0X)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++0x")
else()
    message(STATUS "The compiler ${CMAKE_CXX_COMPILER} has no C++11 support. Please use a different C++ compiler.")
endif()


ADD_SUBDIRECTORY(TExcept)
ADD_SUBDIRECTORY(TRedis)
ADD_SUBDIRECTORY(TUtil)
