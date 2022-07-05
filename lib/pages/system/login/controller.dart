import 'package:base_framework/common/index.dart';
import 'package:base_framework/pages/system/main/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';

class LoginController extends GetxController {
  LoginController();

  /// 用户名 / 密码控制器
  TextEditingController accountController = TextEditingController(
      text: Storage().getString(Constants.storageAccount));
  TextEditingController pwdController = TextEditingController();

  /// 表单 key
  GlobalKey userformKey = GlobalKey<FormState>();

  /// 登录
  Future<void> onSignIn() async {
    if ((userformKey.currentState as FormState).validate()) {
      try {
        Loading.show(text: "Logining, Please...");
        UserProfileModel profile = await UserApi.login(UserLoginRequest(
          account: accountController.text,
          passwd: securityMD5(pwdController.text),
        ));
        await UserService.to.setToken(profile.accessToken!); // 设置令牌
        await UserService.to.setProfile(profile); // 设置profile
        await Loading.success(text: "Login Succeeded!");
        Get.offAll(() => const MainPage());
        Storage().setString(Constants.storageAccount, accountController.text);
      } catch (e) {
        await Loading.error(text: "Login Failed!");
      } finally {
        await Loading.dismiss();
      }
    }
  }

  /// 账号校验
  onAccountValidator() {
    return Validatorless.multiple([
      Validatorless.required("Please enter your account."),
      Validatorless.min(3, "The account must be at least 3 characters."),
      Validatorless.max(20, "The account must be at most 20 characters."),
    ]);
  }

  /// 校验密码
  onPasswordValidator() {
    return Validatorless.multiple([
      Validatorless.required("Please enter your password."),
      Validatorless.min(6, "The password must be at least 6 characters."),
      Validatorless.max(18, "The password must be at most 18 characters."),
    ]);
  }

  _initData() {
    update(["login"]);
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

  @override
  void dispose() {
    super.dispose();
    accountController.dispose();
    pwdController.dispose();
  }
}
