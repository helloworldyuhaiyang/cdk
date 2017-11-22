#Taiji Mac 单独编译步骤
1.进入 CMakeList.txt所在目录
cmake -DCMAKE_INSTALL_PREFIX=/opt/cdk/taiji/v1.0/Taiji -DPOCO_PATH=/opt/cdk/poco/v1.6.0
sudo make 
sudo make install

# 可以轻松的实现单实例了。
```
  cpp 文件里显示实例化:
   template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 0>;
   template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 1>;
   template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 2>;
   template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 3>;

  h 文件模板声明:
   extern template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 0>;
   extern template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 1>;
   extern template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 2>;
   extern template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 3>;

  重命名模板类型，方便使用
   using LogApplicaton      = Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 0>;
   using LogRedis           = Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 1>;
   using LogKafka           = Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 2>;

```

# 可以向下面这样的写 http 服务器。
```
 CHTTPRequestHandlerFactory *factory = new CHTTPRequestHandlerFactory;
    factory->addHandlerAndFun("/url1/handler1", &CHttpHandler1::handleRequest1);
    factory->addHandlerAndFun("/url1/handler2", &CHttpHandler1::handleRequest2);
    factory->addHandlerAndFun("/url1/handler3", &CHttpHandler1::handleRequest3);
    factory->addHandlerAndFun("/url2/handler1", &CHttpHandler2::handleRequest1);
    factory->addHandlerAndFun("/url2/handler2", &CHttpHandler2::handleRequest2);
    factory->addHandlerAndFun("/url2/handler3", &CHttpHandler2::handleRequest3);

    factory->addHandler<CHttpHandler3>("/url3");
    factory->addHandler<CHttpHandler4>("/url4");
    _server.init(factory, 9020, 5, 50, 50);

```

还包括 日志，ServerAppliocation(应用程序框架),CTimingThread(定时器)...

