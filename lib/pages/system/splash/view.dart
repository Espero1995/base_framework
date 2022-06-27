import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_controller) {
        return Scaffold(
          appBar: AppBar(title: const Text("splash")),
          body: SafeArea(
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Get.toNamed(RouteNames.stylesIndexRoute);
                },
                child: const Text("跳转到样式页面"),
              ),
            ),
          ),
        );
      },
    );
  }
}
