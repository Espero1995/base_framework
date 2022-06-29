import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  Widget _buildView() {
    return Container(
      color: Colors.white,
      child: const ImageWidget.asset(
        AssetsImages.splashPng,
        fit: BoxFit.none,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      id: "splash",
      builder: (_controller) {
        return _buildView();
      },
    );
  }
}
