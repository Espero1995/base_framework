import 'package:base_framework/common/index.dart';
import 'package:base_framework/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SystemController extends GetxController {
  SystemController();

  /// 退出登录
  void onLogout() async {
    await CustomDialog.show(
      context: Get.context!,
      confirm: Text(LocaleKeys.commonBottomConfirm.tr),
      cancel: Text(LocaleKeys.commonBottomCancel.tr),
      builder: (BuildContext context) {
        return Text(LocaleKeys.profileLogoutTip.tr);
      },
      onConfirm: () {
        UserService.to.logout();
        Get.offAll(() => const LoginPage());
      },
      onCancel: () => Navigator.of(Get.context!).pop(),
    );
  }

  _initData() {
    update(["system"]);
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
