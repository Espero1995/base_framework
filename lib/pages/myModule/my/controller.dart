import 'package:base_framework/common/index.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  MyController();

  /// 多语言
  onLanguageSelected() {
    var en = Translation.supportedLocales[0];
    var zh = Translation.supportedLocales[1];

    ConfigService.to.setLanguage(
        ConfigService.to.locale.toLanguageTag() == en.toLanguageTag()
            ? zh
            : en);
  }

  // 主题
  onThemeSelected() async {
    await ConfigService.to.setThemeMode();
  }

  /// 检测是否有欢迎页
  static bool _isFirstOpenChecked = !ConfigService.to.firstOpen;
  set isFirstOpenChecked(value) {
    _isFirstOpenChecked = value;
    ConfigService.to.setAlreadyOpen(boolValue: !value);
    update(["welcome"]);
  }

  get isFirstOpenChecked => _isFirstOpenChecked;

  _initData() {
    update(["my"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
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
