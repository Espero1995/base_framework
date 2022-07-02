import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'common/index.dart';

class Global {
  /// 是否 release
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  static Future<void> init() async {
    // 这个表示先就行原生端（ios android）插件注册，然后再处理后续操作，这样能保证代码运行正确。
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    // 工具类 一定要先初始化，因为后面的userService涉及到storage的东西
    await Storage().init();
    Loading();

    Get.put<ConfigService>(ConfigService());
    Get.put<UserService>(UserService());
    Get.put<HttpRequestService>(HttpRequestService());
  }
}
