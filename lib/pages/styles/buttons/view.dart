import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class ButtonsPage extends GetView<ButtonsController> {
  const ButtonsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildButtons(),
        ],
      ).paddingAll(AppSpace.card),
    );
  }

  Widget _buildButtons() {
    return <Widget>[
      // 1 文字按钮
      ButtonWidget.text(
        "文字按钮",
        textSize: 15,
        textColor: Colors.blue,
        onTap: () {},
      ).paddingBottom(AppSpace.listRow),

      // 2 图标按钮
      ButtonWidget.icon(
        IconWidget.svg(
          AssetsSvgs.pHomeSvg,
          size: 30,
        ),
      ).paddingBottom(AppSpace.listRow),

      // 3 图标文字按钮
      ButtonWidget.iconText(
        IconWidget.svg(
          AssetsSvgs.pHomeSvg,
          size: 30,
        ),
        "Home",
        iconTextSpace: 5,
        textSize: 17,
      ).paddingBottom(AppSpace.listRow),

      // 4 图标文字按钮 - 边框
      ButtonWidget.iconText(
        IconWidget.svg(
          AssetsSvgs.pHomeSvg,
          size: 30,
        ),
        "Home",
        iconTextSpace: 5,
        textSize: 17,
        borderColor: Get.theme.colorScheme.outline.withOpacity(0.4),
        borderRadius: 10,
      ).height(40).width(120).paddingBottom(AppSpace.listRow),

      // 5 图标文字按钮 - 反转
      ButtonWidget.iconText(
        IconWidget.icon(
          Icons.navigate_next,
          size: 24,
          color: Colors.purple.shade300,
        ),
        "All",
        iconTextSpace: 0,
        textDirection: TextDirection.rtl,
      ).paddingBottom(AppSpace.listRow),

      // 6 图标文字按钮 - 纵向
      ButtonWidget.iconText(
        IconWidget.svg(
          AssetsSvgs.pHomeSvg,
          size: 30,
        ),
        "Home",
        isColumn: true,
      ).paddingBottom(AppSpace.listRow),

      // 7 primary 主按钮
      ButtonWidget.primary(
        "Buy Now",
        textSize: 20.0,
        borderRadius: 25,
      ).width(250).height(50).paddingBottom(AppSpace.listRow),

      // 8 primary 主按钮
      ButtonWidget.primary(
        "Buy Now",
        icon: IconWidget.svg(
          AssetsSvgs.pHomeSvg,
          color: Colors.white,
        ),
      ).height(50).width(200).paddingBottom(AppSpace.listRow),

      // 9 secondary 主按钮
      ButtonWidget.secondary(
        "Add To Cart",
        icon: IconWidget.image(AssetsImages.defaultPng),
      ).height(50).width(200).paddingBottom(AppSpace.listRow),

      // 10 文字/填充 按钮
      ButtonWidget.textFilled(
        "5",
        bgColor: Get.theme.colorScheme.surfaceVariant.withOpacity(0.5),
        textSize: 12,
        textColor: Colors.grey.shade700,
        borderRadius: 5,
      ).height(30).width(45).paddingBottom(AppSpace.listRow),

      //11 文字/填充/圆形 按钮
      ButtonWidget.textRoundFilled(
        "5",
        bgColor: Get.theme.colorScheme.surfaceVariant.withOpacity(0.4),
        borderRadius: 12,
        textSize: 9,
        textColor: Colors.grey.shade700,
      ).tight(width: 24, height: 24).paddingBottom(AppSpace.listRow),
      // ============================
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonsController>(
      init: ButtonsController(),
      id: "buttons",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("buttons")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
