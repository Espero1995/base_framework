import 'package:base_framework/pages/index.dart';
import 'package:get/get.dart';

/// 主界面依赖
class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<PatternController>(() => PatternController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<MyController>(() => MyController());
    Get.lazyPut<MainController>(() => MainController());
  }
}
