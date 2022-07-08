import 'package:base_framework/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:base_framework/common/index.dart';

import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({Key? key}) : super(key: key);

  // 主视图 必须定义controller 类型否则不会生效
  Widget _buildView(StylesIndexController _controller) {
    return ListView(
      children: <Widget>[
        // 局部修改数据写法
        ListTile(
          title: const TextWidget.body1("GetBuilder 测试update['style_index']"),
          subtitle: TextWidget.body1(_controller.title),
          onTap: () {
            _controller.onTextChange("这是我新写的styleIndex内容 ");
          },
        ),

        const Divider(),

        //文本样式
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesTextRoute),
          title: const TextWidget.body1("Text 文本"),
        ),
        const Divider(),

        //图标
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesIconRoute),
          title: const TextWidget.body1("Icon 图标"),
        ),

        const Divider(),

        //缓存图片
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesImageRoute),
          title: const TextWidget.body1("Image 图片"),
        ),

        const Divider(),

        //按钮
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesButtonsRoute),
          title: const TextWidget.body1("Button 按钮"),
        ),

        const Divider(),

        //input 输入框
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesInputsRoute),
          title: const TextWidget.body1("Input 输入框"),
        ),

        const Divider(),

        //textForm 输入框
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesTextFormRoute),
          title: const TextWidget.body1("TextForm 输入框"),
        ),

        const Divider(),

        // modal 弹框
        ListTile(
          onTap: () => {},
          title: const TextWidget.body1("Modal 弹框"),
        ),

        const Divider(),

        // PickerView
        ListTile(
          onTap: () => {},
          title: const TextWidget.body1("PickerView"),
        ),

        const Divider(),

        // 下拉选择框
        ListTile(
          onTap: () => {},
          title: const TextWidget.body1("下拉选择框"),
        ),

        const Divider(),

        // 单选tab/多选tab
        ListTile(
          onTap: () => {},
          title: const TextWidget.body1("单选tab / 多选tab"),
        ),

        const Divider(),

        // 下拉刷新/上拉加载
        ListTile(
          onTap: () => {},
          title: const TextWidget.body1("下拉刷新/上拉加载"),
        ),

        const Divider(),

        // 动画加载 Loading...
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesToastLoadingRoute),
          title: const TextWidget.body1("动画加载 Loading..."),
        ),

        const Divider(),

        // 轮播图
        ListTile(
          onTap: () => {},
          title: const TextWidget.body1("轮播图"),
        ),

        const Divider(),

        // 自定义ListView
        ListTile(
          onTap: () => {},
          title: const TextWidget.body1("自定义ListView"),
        ),

        const Divider(),

        // 自定义GridView
        ListTile(
          onTap: () => {},
          title: const TextWidget.body1("自定义GridView"),
        ),

        const Divider(),

        // 选择照片/拍照
        ListTile(
          onTap: () => {},
          title: const TextWidget.body1("选择照片/拍照"),
        ),

        const Divider(),

        // 验证码 Pin
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesPinRoute),
          title: const TextWidget.body1("验证码Pin"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      id: "style_index",
      builder: (_controller) {
        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.stylesTitle.tr)),
          body: SafeArea(
            child: _buildView(_controller),
          ),
        );
      },
    );
  }
}
