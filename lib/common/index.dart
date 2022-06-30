library common;

export 'apis/index.dart'; // api文件 - 拉取数据
export 'components/index.dart'; // 业务组件
export 'extension/index.dart'; // dart基础类的一些扩展方法
export 'i18n/index.dart'; // 国际化
export 'models/index.dart'; // 对应api封装的数据模型
export 'routers/index.dart'; // 路由管理
export 'services/index.dart'; // 一些全局的服务项配置，例如网络请求、用户登录信息的处理等。
export 'styles/index.dart'; // 公共样式
export 'utils/index.dart'; // 工具类
export 'values/index.dart'; // 常量值（配置值）
export 'widgets/index.dart'; //基础组件 - 复用性最强，最好不要依赖第三方库，导致其他项目无法复用
