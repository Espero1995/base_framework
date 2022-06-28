import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return ScreenUtilInit(
      designSize: const Size(414, 896), // 设计稿中设备的尺寸(单位随意,建议dp,但在使用过程中必须保持一致)
      splitScreenMode: false, // 支持分屏尺寸
      minTextAdapt: false, // 是否根据宽度/高度中的最小值适配文字
      // 一般返回一个MaterialApp类型的Function()
      builder: () {
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

          // builder
          builder: (context, child) {
            ScreenUtil.setContext(context); // 传入context会更灵敏的根据屏幕变化而改变
            // child = xxxx; // 其他如果需要child边如此赋值即可。
            // 不随系统字体缩放比例
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },

          //debug 图标是否显示
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
