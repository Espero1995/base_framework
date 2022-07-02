import 'dart:ui';

import 'package:base_framework/common/values/constants.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../index.dart';

class ConfigService extends GetxService {
  // 这是一种单例写法 后面我们会用到的onReady 的时候初始数据。【使用的时候例如：ConfigService.to.version即可】
  static ConfigService get to => Get.find();

  // 项目版本号
  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';

  // 国家化
  Locale locale = PlatformDispatcher.instance.locale;

  // 主题
  final RxBool _isDarkMode = Get.isDarkMode.obs;
  bool get isDarkMode => _isDarkMode.value;

  // 是否首次打开
  bool get firstOpen => Storage().getBool(Constants.storageFirstOpen);

  @override
  void onReady() {
    super.onReady();
    getPlatform();
    initLanguage();
    initTheme();
  }

  // ==================== 平台信息 ====================
  /// 获取pubspec.yaml配置中的版本号(version)
  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // ==================== 国际化 ====================
  /// 初始化语言
  void initLanguage() {
    final langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) return;
    var index = Translation.supportedLocales.indexWhere((el) {
      return el.languageCode == langCode;
    });
    if (index < 0) return;
    locale = Translation.supportedLocales[index];
    Get.updateLocale(locale);
  }

  /// 更改语言
  void setLanguage(Locale value) {
    locale = value;
    Get.updateLocale(value);
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  // ==================== 切换主题  ====================
  /// 初始化主题
  void initTheme() {
    final themeCode = Storage().getString(Constants.storageThemeCode);
    _isDarkMode.value = themeCode == "dark" ? true : false;
    Get.changeTheme(
      themeCode == 'dark' ? AppTheme.dark : AppTheme.light,
    );
  }

  /// 更改主题
  Future<void> setThemeMode() async {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeTheme(
      _isDarkMode.value == true ? AppTheme.dark : AppTheme.light,
    );
    await Storage().setString(Constants.storageThemeCode,
        _isDarkMode.value == true ? "dark" : "light");

    final themeCode = Storage().getString(Constants.storageThemeCode);
    print(
        "我要更改的主题是:${_isDarkMode.value == true ? '暗色' : '亮色'}=====本地存储的key：$themeCode");

    // 重新载入视图，因为
    // 1 有自定义颜色
    // 2 有些视图被缓存
    Get.offAllNamed(RouteNames.systemSplashRoute);
  }

  // ==================== 首次打开 ====================
  // 标记已打开app
  void setAlreadyOpen({bool boolValue = true}) {
    Storage().setBool(Constants.storageFirstOpen, boolValue);
  }
}
