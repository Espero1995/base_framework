import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PinController extends GetxController {
  PinController();

  TextEditingController pinController = TextEditingController();
  GlobalKey pinFormKey = GlobalKey<FormState>();

  // pin 触发提交
  void onPinSubmit(String val) {
    debugPrint("onPinSubmit: $val");
    if (val == '888888') {
      Loading.show(text: "Verifying, please...");
      Future.delayed(const Duration(milliseconds: 1500), () async {
        await Loading.dismiss();
        await Loading.success(text: "Verification Succeeded!");
        Get.back();
      });
    }
  }

  // 验证 pin
  String? pinValidator(val) {
    return val == '888888' ? null : 'Error Code, Default:888888';
  }

  _initData() {
    update(["pin"]);
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

  @override
  void dispose() {
    super.dispose();
    pinController.dispose();
  }
}
