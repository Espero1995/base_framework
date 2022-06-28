import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:validatorless/validatorless.dart';
import 'index.dart';

class TextFormPage extends GetView<TextFormController> {
  const TextFormPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: _buildTextForm().padding(all: AppSpace.page),
    );
  }

  Widget _buildTextForm() {
    return Form(
      key: controller.formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        TextFormWidget(
          keyboardType: TextInputType.emailAddress,
          controller: controller.emailController,
          labelText: "邮箱",
          hintText: "请输入邮箱",
          validator: controller.validateEmail(),
        ).marginOnly(
          bottom: 10,
        ),
        TextFormWidget(
          controller: controller.pwdController,
          hintText: "请输入邮箱密码",
          isObscure: true,
          validator: controller.validatePwd(),
        ).marginOnly(
          bottom: 30,
        ),
        ButtonWidget.primary(
          "提交",
          onTap: () {
            if ((controller.formKey.currentState as FormState).validate()) {
              try {
                print("提交表单啦");
              } finally {
                print("提交表单请求结束后会触发下！");
              }
            }
          },
        ).height(45),
      ].toColumn(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TextFormController>(
      init: TextFormController(),
      id: "text_form",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("text_form")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
