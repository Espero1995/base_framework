import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ToastLoadingPage extends GetView<ToastLoadingController> {
  const ToastLoadingPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // toast
      ButtonWidget.primary(
        "toast",
        onTap: () => Loading.toast("Toast Loading"),
      ).height(40).width(200).paddingTop(50).paddingBottom(AppSpace.listRow),

      // loading
      ButtonWidget.primary(
        "loading",
        onTap: () {
          Loading.show(text: "登录中，请稍后...");
          Future.delayed(
            const Duration(seconds: 2),
            () => Loading.dismiss(),
          );
        },
      ).height(40).width(200).paddingBottom(AppSpace.listRow),

      // success
      ButtonWidget.textFilled(
        "Success",
        textColor: Colors.white,
        bgColor: Colors.green,
        borderRadius: 5,
        onTap: () => Loading.success(),
      ).height(40).width(200).paddingBottom(AppSpace.listRow),

      // error
      ButtonWidget.textFilled(
        "Error",
        textColor: Colors.white,
        bgColor: Colors.red,
        borderRadius: 5,
        onTap: () => Loading.error(text: "未知错误，请联系管理员"),
      ).height(40).width(200).paddingBottom(AppSpace.listRow),
    ].toColumn().center();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ToastLoadingController>(
      init: ToastLoadingController(),
      id: "toast_loading",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("toast_loading")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
