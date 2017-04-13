cmake_minimum_required(VERSION 2.8)
project(Taiji)

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

set(relayLibPath ${RELAY_LIB_PATH})
#去掉逗号。第三个参数表示输出，第四个是输入
string(REPLACE "," " " relayLibPath ${relayLibPath})
#将空格分隔的参数解析为分号分隔的列表。也可以以上两步都不做，在传参的时候，参数间用分号分隔而不是逗号
separate_arguments(var UNIX_COMMAND ${relayLibPath})

foreach(F ${var})
    INCLUDE_DIRECTORIES(
        ${CMAKE_INSTALL_PREFIX}/include
        ADD_SUBDIRECTORY(../)
        ${F}/include
    )

    LINK_LIBRARIES(
        ${F}/lib
    )
endforeach(F)

ADD_SUBDIRECTORY(TExcept)
ADD_SUBDIRECTORY(TRedis)
ADD_SUBDIRECTORY(TUtil)
