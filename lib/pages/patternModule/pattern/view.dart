import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class PatternPage extends GetView<PatternController> {
  const PatternPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("PatternPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PatternController>(
      init: PatternController(),
      id: "pattern",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.tabBarPattern.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
