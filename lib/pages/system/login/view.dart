import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(BuildContext context) {
    return SingleChildScrollView(
      child: <Widget>[
        const ImageWidget.asset(AssetsImages.loginLogoPng).paddingBottom(20.w),
        const PageTitleWidget(
          title: "Welcome Login!",
          desc: "Please enter your account and password to study flutter.",
        ),
        // 表单
        _buildForm(context).padding(top: 10, left: 15, right: 15),
      ].toColumn().center().paddingHorizontal(AppSpace.page),
    );
  }

  // 表单页
  Widget _buildForm(BuildContext context) {
    return Form(
      key: controller.userformKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // 账号
        TextFormWidget(
          controller: controller.accountController,
          hintText: "Please enter your account.",
          validator: controller.onAccountValidator(),
        ).paddingBottom(AppSpace.listRow.w * 2),

        // 密码
        TextFormWidget(
          controller: controller.pwdController,
          hintText: "Please enter your password.",
          isObscure: true,
          validator: controller.onPasswordValidator(),
        ).paddingBottom(AppSpace.listRow.w * 2),

        // Forgot Password?
        ButtonWidget.text(
          "verify code?",
          textColor: Colors.blue,
          textWeight: FontWeight.bold,
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            Get.toNamed(RouteNames.stylesPinRoute);
          },
        ).width(100.w).alignRight().paddingBottom(30.w),

        // 登录按钮
        ButtonWidget.textRoundFilled(
          "Sign In",
          onTap: controller.onSignIn,
          textSize: 17,
          borderRadius: 30,
        ).height(AppSpace.buttonHeight).paddingBottom(30.w),
      ].toColumn(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: "login",
      builder: (_) => GestureDetector(
        onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            systemOverlayStyle: Theme.of(context).brightness == Brightness.light
                ? SystemUiOverlayStyle.dark
                : SystemUiOverlayStyle.light,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: _buildView(context),
          ),
        ),
      ),
    );
  }
}
