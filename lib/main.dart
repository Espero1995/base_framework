import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'global.dart';
import 'common/index.dart';

void main() async {
  await Global.init(); //全局初始化
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Base Framework',

      //样式
      theme: ConfigService.to.isDarkMode ? AppTheme.dark : AppTheme.light,

      // 路由
      initialRoute: RouteNames.splashRoute,
      getPages: RoutePages.pages,
      navigatorObservers: [RoutePages.observer], //路由监听

      // 多语言
      translations: Translation(), // 词典
      localizationsDelegates: Translation.localizationsDelegates, // 代理
      supportedLocales: Translation.supportedLocales, // 支持的语言种类
      locale: ConfigService.to.locale, // 当前语言种类
      fallbackLocale: Translation.fallbackLocale, // 默认语言种类

      //debug 图标是否显示
      debugShowCheckedModeBanner: false,
    );
  }
}
