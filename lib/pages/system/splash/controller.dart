import 'package:base_framework/common/index.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  SplashController();

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  void toHome() {
    Future.delayed(const Duration(seconds: 1)).then((_) async {
      /**
       * 处理业务：
       * 1.欢迎页 （第一次加载App）
       * 2.主页面 （是否有用户信息）
       * （1）登录页
       * （2）首页
       */
      console.log(
          "是否登录了？${UserService.to.isLogin}====${UserService.to.profile.toJson()}");
      if (ConfigService.to.firstOpen == false) {
        Get.offAllNamed(RouteNames.systemWelcomeRoute);
      } else {
        if (await UserService.to.checkIsLogin()) {
          Get.offAllNamed(RouteNames.mainRoute);
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    // 删除设备启动图
    FlutterNativeSplash.remove();

    // 跳转到首页
    toHome();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
