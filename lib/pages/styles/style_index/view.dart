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

        //版本号
        ListTile(
          title: Text(
            "版本号 - v${ConfigService.to.version}",
            style: const TextStyle(
              fontFamily: 'NotoSansSC',
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),

        const Divider(),

        //国际化
        ListTile(
          title: Text(
            "语言 : ${ConfigService.to.locale.toLanguageTag()}",
            style: const TextStyle(
              fontFamily: 'PTSerif',
              fontStyle: FontStyle.italic,
            ),
          ),
          onTap: () {
            _controller.onLanguageSelected();
          },
        ),

        const Divider(),

        // 主题
        ListTile(
          title: TextWidget.body1(
              "主题 : ${ConfigService.to.isDarkMode ? "Dark" : "Light"}"),
          onTap: () {
            _controller.onThemeSelected();
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