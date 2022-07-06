import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class MyPage extends GetView<MyController> {
  const MyPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[
      ElevatedButton(
        onPressed: () {
          Get.toNamed(RouteNames.stylesIndexRoute);
        },
        child: const Text("Style"),
      ),
    ].toColumn(mainAxisAlignment: MainAxisAlignment.center).center();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      init: MyController(),
      id: "my",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("my")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
