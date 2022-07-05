import 'package:base_framework/common/index.dart';
import 'package:base_framework/pages/index.dart';
// import 'package:base_framework/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StylesIndexController extends GetxController {
  StylesIndexController();

  String _title = "默认内容";
  set title(value) => _title = value;
  get title => _title;

  /// 检测是否有欢迎页
  static bool _isFirstOpenChecked = !ConfigService.to.firstOpen;
  set isFirstOpenChecked(value) {
    _isFirstOpenChecked = value;
    ConfigService.to.setAlreadyOpen(boolValue: !value);
    update(["style_index"]);
  }

  get isFirstOpenChecked => _isFirstOpenChecked;

  onTextChange(String str) {
    title = str;
    update(["style_index"]);
  }

  // 多语言
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

  /// 退出登录
  void onLogout() async {
    await CustomDialog.show(
      context: Get.context!,
      confirm: const Text('Yes, Logout'),
      cancel: const Text('Cancel'),
      builder: (BuildContext context) {
        return const Text('Are you sure want to logout?');
      },
      onConfirm: () {
        UserService.to.logout();
        Get.offAll(() => const LoginPage());
      },
      onCancel: () => Navigator.of(Get.context!).pop(),
    );
  }

  _initData() {
    update(["style_index"]);
  }

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
