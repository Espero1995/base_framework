import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[
      _buildSlider(),
      _buildBar(),
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.start,
        )
        .paddingAll(AppSpace.page);
  }

  // slider
  Widget _buildSlider() {
    return GetBuilder<WelcomeController>(
      id: "slider",
      init: controller,
      builder: (_contronller) => _contronller.items == null
          ? const SizedBox()
          : WelcomeSlider(
              _contronller.items!,
              carouselController: _contronller.carouselController,
              onPageChanged: _contronller.onPageChanged,
            ),
    );
  }

  // bar
  // skip + indicator + next
  Widget _buildBar() {
    return GetBuilder<WelcomeController>(
      id: 'bar',
      init: controller,
      builder: (_contronller) {
        return _contronller.isShowStart
            ?
            // 开始
            ButtonWidget.textFilled(
                "Get Started",
                borderRadius: 22,
                textSize: 16,
                onTap: controller.onToMain,
              ).height(44)
            : <Widget>[
                // 跳过
                ButtonWidget.text(
                  "Skip",
                  textColor: Colors.red,
                  textSize: 14,
                  textWeight: FontWeight.bold,
                  onTap: controller.onToMain,
                ),
                // 指示标
                SliderIndicatorWidget(
                  length: 3,
                  currentIndex: controller.currentIndex,
                ),
                // 下一页
                ButtonWidget.text(
                  "Next",
                  textColor: Colors.blue,
                  textSize: 14,
                  textWeight: FontWeight.bold,
                  onTap: controller.onNext,
                ),
              ].toRow(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      id: "welcome",
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
