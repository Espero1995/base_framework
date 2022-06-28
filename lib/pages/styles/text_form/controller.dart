import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class TextFormController extends GetxController {
  TextFormController();

  GlobalKey formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  /// 校验邮箱
  validateEmail() {
    return Validatorless.multiple([
      Validatorless.required("请输入邮箱"),
      Validatorless.min(6, "邮箱长度不得少于6位"),
      Validatorless.max(18, "邮箱长度不得超过18位"),
      Validatorless.email("请输入正确的邮箱格式"),
    ]);
  }

  /// 校验密码
  validatePwd() {
    return Validatorless.multiple([
      Validatorless.required("请输入密码"),
      Validatorless.min(6, "密码长度不得少于6位"),
      Validatorless.max(18, "密码长度不得超过18位"),
    ]);
  }

  _initData() {
    update(["text_form"]);
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
    emailController.dispose();
    pwdController.dispose();
  }
}
