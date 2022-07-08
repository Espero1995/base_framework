import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class InputsPage extends GetView<InputsController> {
  const InputsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView(BuildContext context) {
    return SingleChildScrollView(
      child: _buildInputs(context).center(),
    );
  }

  Widget _buildInputs(BuildContext context) {
    return <Widget>[
      // 1 文本
      InputWidget.text(
        controller: controller.textController,
      ).width(300).paddingBottom(AppSpace.listRow),

      // 2 文本 带边框
      InputWidget.textBorder(
        controller: controller.textBorderController,
      ).width(300).paddingBottom(AppSpace.listRow),

      // 3 文本 填充
      InputWidget.textFilled(
        controller: controller.textFilledController,
        fillColor: Colors.redAccent,
      ).width(300).paddingBottom(AppSpace.listRow),

      // 4 图标文本 填充
      InputWidget.iconTextFilled(
        IconWidget.svg(
          AssetsSvgs.tabHomeSvg,
        ).paddingRight(10).paddingLeft(10),
        controller: controller.iconTextFilledController,
      ).width(300).paddingBottom(AppSpace.listRow),

      // 5 后缀图标文本 填充
      InputWidget.suffixTextFilled(
        IconWidget.icon(
          Icons.search,
        ).paddingRight(5).inkWell(
          onTap: () {
            print("搜索一下呀🔍");
          },
        ),
        controller: controller.suffixTextFilledController,
      ).width(300).paddingBottom(AppSpace.listRow),

      // 6 搜索
      InputWidget.search(
        controller: controller.searchController,
        hintText: "搜索 > 输入框",
        suffixIcon: const Icon(Icons.dark_mode),
      ).width(300).paddingBottom(AppSpace.listRow),

      // 触发关闭键盘点击事件
      ElevatedButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode()); //收起键盘
        },
        child: const Text("点我 -> 关闭键盘 / 通过GestureDetector添加收起键盘"),
      ),

      // 1 选择框
      CheckBoxWidget(
        value: controller.checkVal,
        onChanged: controller.onCheckBox,
        fontColor: Colors.green,
      ).width(300).paddingBottom(AppSpace.listRow),

      // 2 选择框 all
      CheckBoxWidget.all(
        controller.checkVal,
        controller.onCheckBox,
        space: 5,
        label: const TextWidget.title3("全选"),
      ).width(300).paddingBottom(AppSpace.listRow),

      // 3 选择框 single
      CheckBoxWidget.single(
        controller.checkVal,
        controller.onCheckBox,
        label: const TextWidget.title3("行选择"),
      ).width(300).paddingBottom(AppSpace.listRow),

      // 4 选择框 radio
      CheckBoxWidget.radio(
        controller.checkVal,
        controller.onCheckBox,
        label: const TextWidget.body1("radio"),
      ).width(300).paddingBottom(AppSpace.listRow),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InputsController>(
      init: InputsController(),
      id: "inputs",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("inputs")),
          body: SafeArea(
            child: _buildView(context),
          ),
        );
      },
    );
  }
}
