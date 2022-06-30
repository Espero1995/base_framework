import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'common/index.dart';

class Global {
  static Future<void> init() async {
    // 这个表示先就行原生端（ios android）插件注册，然后再处理后续操作，这样能保证代码运行正确。
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    Get.put<ConfigService>(ConfigService());

    // 工具类
    await Storage().init();
    Loading();
  }
}
