project(TRedis)

#设置此工程的源码
set(SRC
        Command.cpp
        CRedisClient.cpp
        CRedisPool.cpp
        CRedisSocket.cpp
        CResult.cpp
        RedisClientConnection.cpp
        RedisClientHash.cpp
        RedisClientHyperLogLog.cpp
        RedisClientKey.cpp
        RedisClientList.cpp
        RedisClientPSub.cpp
        RedisClientScript.cpp
        RedisClientServer.cpp
        RedisClientSet.cpp
        RedisClientSortedSet.cpp
        RedisClientString.cpp
        RedisTransaction.cpp
        )

set(HEADFILE
        Command.h
        CRedisClient.h
        CRedisPool.h
        CRedisSocket.h
        CResult.h
        ExceptRedis.h
        redisCommon.h
        )

#设置头文件的安装路径
install(FILES ${HEADFILE} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/Taiji/TRedis)

#设置输出的库的类型（SHARED）和名字（add）
add_library(TaijiRedis SHARED ${SRC})

#设置库文件的安装路径
install(TARGETS TaijiRedis LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
