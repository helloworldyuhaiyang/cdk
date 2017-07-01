#ifndef CSINGLETON
#define CSINGLETON


namespace Taiji
{

namespace TUtil {

/**
 * @brief 把某个类变为单实例的模板类
 * @tparam T 要做为单实例的类
 * @tparam index 使用 index 可以对同一个类生成不同的单实例
 * @example
 *
 * 下面对 CLog 给每个模块做一个单实例
 *
 * cpp 文件里显示实例化:
 *  template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 0>;
 *  template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 1>;
 *  template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 2>;
 *  template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 3>;
 *
 * h 文件模板声明:
 *  extern template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 0>;
 *  extern template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 1>;
 *  extern template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 2>;
 *  extern template class Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 3>;
 *
 * 重命名模板类型，方便使用
 *  using LogApplicaton      = Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 0>;
 *  using LogRedis           = Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 1>;
 *  using LogKafka           = Taiji::TUtil::CSingleton<Taiji::TUtil::CLog, 2>;
 *
 */
template<typename T, int index = 0>
class CSingleton
{
public:
    CSingleton() = delete;
    CSingleton(const CSingleton &) = delete;
    CSingleton & operator =(const CSingleton &) = delete;
    static T& instance()
    {
        static T x;
        return x;
    }
};


}
}

#endif // CSINGLETON

