project(TaijiUtil)

###########################设置依赖##########################
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



############################设置生成规则############################
#设置输出的库的类型（SHARED）和名字（add）
add_library(${PROJECT_NAME} SHARED ${SRC})

#设置具体的依赖库
target_link_libraries(${PROJECT_NAME} PocoFoundation PocoNet PocoUtil)



##############################安装步骤#############################
#设置头文件的安装路径
install(FILES ${HEADFILE} DESTINATION include/Taiji/TUtil)

#设置库文件的安装路径
install(TARGETS ${PROJECT_NAME} LIBRARY DESTINATION lib)
