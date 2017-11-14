# CDK
## 特别说明
poco 1.6.1 JSON set() 的时候如果key已经存在的 key 则会 set 失败。
```
void Object::set(const std::string& key, const Dynamic::Var& value)
{
	std::pair<ValueMap::iterator, bool> ret = _values.insert(ValueMap::value_type(key, value));
	if (_preserveInsOrder)
	{
		KeyPtrList::iterator it = _keys.begin();
		KeyPtrList::iterator end = _keys.end();
		for (; it != end; ++it)
		{
			if (key == **it) return;
		}
		_keys.push_back(&ret.first->first);
	}
}
```

## 使用 cdk 开发的优点
1.一键部署c,c++ 的运行环境。开发环境和生产环境安装好cdk之后，编写的代码,所有的库环境一致，可以保证在开发环的代码上线不会遇到问题。 

2.使用约定优于配置的方式实现的个依赖库的向前兼容。同时保证了同一台服务器上部署的应用可以使用不同版本的相同的动态库。 
    
**实现原理也很简单:**
    同一个版本的库在 cdk 容器中会以版本号作为路径来做区分。你的不同的应用程序链接不同的动态库就好了。 

3.可裁剪性。cdk中会有很多的第三方库。但不一定每个项目都会用到。你可以在 install.sh 中选择性的安装你需要的第三方库。 

4.跨平台。现在由于开发是在 ubuntu 下，而生产环境通常是 centos。所以现在的 cdk 是跨 centos 和 ubuntu 的。 

## cdk 的一些缺点   
1.因为需要把相关的包的源码都加进去，从 git 上拉下来的时间会比较长。  


## cdk 的使用及原理
1.编辑 common.sh 修改 g_dest_path 为想要安装的路径。注意要保持生产环境和开发环境一致。
2. 编辑 install.sh 把不需要的库注释掉。
3. sudo ./install.sh  等待安装完成。

原理是使用 shell 脚本在不同的 linux 发行版下编译同样的库，并安装到同样的指定目录。
我们的应用代码，在开发环境开发好，在生产环境一键部署了 cdk 之后，我们的应用就可以在生产上编译运行。

common.sh 提供了 cdk 安装常用的全局变量(cdk安装路径)，方法(cmake ,make 方式安装的动态库的函数)。
install.sh 调用了需要安装的模块。如果要定制裁剪增加某个模块可以在这里增加，或者注释掉。
xxxx.sh 每个开发库都有一个对应的 .sh 文件。这个 .sh 文件就是具体安装某个模块的方法,并且保证兼容 ubuntu 和 centos。通常这个 .sh 调用 　　　　common.sh 里的方法就可以了。







