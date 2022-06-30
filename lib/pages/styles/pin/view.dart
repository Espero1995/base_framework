import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class PinPage extends GetView<PinController> {
  const PinPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 头部标题
        const PageTitleWidget(
          title: "验证",
          desc: "我们将向您发送验证码以继续您的帐户",
        ),
        // 表单
        _buildForm().card(),
      ]
          .toColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
          )
          .paddingHorizontal(AppSpace.page),
    );
  }

  // 表单页
  Widget _buildForm() {
    return Form(
      key: controller.pinFormKey, //设置globalKey，用于后面获取FormState
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // 提示文
        const TextWidget.body1("验证码 Pin").paddingBottom(20.w).alignLeft(),

        // pin
        PinPutWidget(
          controller: controller.pinController,
          validator: controller.pinValidator,
          onSubmit: controller.onPinSubmit,
        ).paddingBottom(50.w),

        // end
      ].toColumn(),
    ).paddingAll(AppSpace.card);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PinController>(
      init: PinController(),
      id: "pin",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: IconWidget.icon(
              Icons.arrow_back_ios_new,
              color: AppColors.primary,
            ).inkWell(
              onTap: () => Get.back(),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
