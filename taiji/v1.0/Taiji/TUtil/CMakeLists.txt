project(TUtil)

#设置此工程的源码
set(SRC
        CLog.cpp
	CLog.h
        CLogs.cpp
        CTimingThread.cpp
        CHttpServer.cpp
        CHTTPRequestHandlerFactory.cpp
        CServerApplication.cpp
        CHTTPRequestHandler.cpp
        )

set(HEADFILE
        CLog.h
        CLogs.h
        CSingleton.h
        CTimingThread.h
        CHttpServer.h
        CHTTPRequestHandlerFactory.h
        CServerApplication.h
        CHTTPRequestHandler.h
        )

set(CLOG $(CMAKE_CURRENT_SOURCE_DIR)/CLog.h)

#设置头文件的安装路径
install(FILES ${HEADFILE} DESTINATION ${CMAKE_INSTALL_PREFIX}/include/Taiji/TUtil)

#设置输出的库的类型（SHARED）和名字（add）
add_library(TaijiUtil SHARED ${SRC})

#设置库文件的安装路径
install(TARGETS TaijiUtil LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/lib)
