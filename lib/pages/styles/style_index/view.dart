import 'package:base_framework/pages/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:base_framework/common/index.dart';

import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({Key? key}) : super(key: key);

  // 主视图 必须定义controller 类型否则不会生效
  Widget _buildView(StylesIndexController _controller) {
    return SingleChildScrollView(
      child: SafeArea(
        child: CustomCellGroup(
          children: [
            // 局部修改数据写法
            CustomCell(
              title:
                  const TextWidget.body1("GetBuilder 测试update['style_index']"),
              subtitle: TextWidget.body1(_controller.title),
              onTap: () {
                _controller.onTextChange("这是我新写的styleIndex内容");
              },
            ),

            //文本样式
            CustomCell(
              iconPath: AssetsSvgs.styleTextSvg,
              title: const TextWidget.body1("Text 文本"),
              onTap: () => Get.toNamed(RouteNames.stylesTextRoute),
            ),

            // 图标
            CustomCell(
              iconPath: AssetsSvgs.styleIconSvg,
              title: const TextWidget.body1("Icon 图标"),
              onTap: () => Get.toNamed(RouteNames.stylesIconRoute),
            ),

            // 缓存图片
            CustomCell(
              iconPath: AssetsSvgs.styleImageSvg,
              title: const TextWidget.body1("Image 图片"),
              onTap: () => Get.toNamed(RouteNames.stylesImageRoute),
            ),

            // 按钮
            CustomCell(
              iconPath: AssetsSvgs.styleButtonSvg,
              title: const TextWidget.body1("Button 按钮"),
              onTap: () => Get.toNamed(RouteNames.stylesButtonsRoute),
            ),

            // input 输入框
            CustomCell(
              iconPath: AssetsSvgs.styleInputSvg,
              title: const TextWidget.body1("Input 输入框"),
              onTap: () => Get.toNamed(RouteNames.stylesInputsRoute),
            ),

            // textForm 输入框
            CustomCell(
              iconPath: AssetsSvgs.styleFormSvg,
              title: const TextWidget.body1("TextForm 输入框"),
              onTap: () => Get.toNamed(RouteNames.stylesTextFormRoute),
            ),

            // modal 弹框
            CustomCell(
              iconPath: AssetsSvgs.styleModalSvg,
              title: const TextWidget.body1("Modal 弹框"),
              onTap: () => {},
            ),

            // PickerView
            CustomCell(
              iconPath: AssetsSvgs.stylePickerViewSvg,
              title: const TextWidget.body1("PickerView 选择器"),
              onTap: () => {},
            ),

            // 下拉选择框
            CustomCell(
              iconPath: AssetsSvgs.styleDropDownBoxSvg,
              title: const TextWidget.body1("Dropdown 下拉选择框"),
              onTap: () => {},
            ),

            // 单选tab/多选tab
            CustomCell(
              iconPath: AssetsSvgs.styleTabSvg,
              title: const TextWidget.body1("Tab 单选/多选"),
              onTap: () => {},
            ),

            // 下拉刷新/上拉加载更多
            CustomCell(
              iconPath: AssetsSvgs.styleRefreshSvg,
              title: const TextWidget.body1("Refresh 下拉刷新/上拉加载更多"),
              onTap: () => {},
            ),

            // 动画加载 loading...
            CustomCell(
              iconPath: AssetsSvgs.styleLoadingSvg,
              title: const TextWidget.body1("Loading 加载动画"),
              onTap: () => Get.toNamed(RouteNames.stylesToastLoadingRoute),
            ),

            // 轮播图
            CustomCell(
              iconPath: AssetsSvgs.styleCarouselSvg,
              title: const TextWidget.body1("Swiper 轮播图"),
              onTap: () => {},
            ),

            // 自定义ListView
            CustomCell(
              iconPath: AssetsSvgs.styleListSvg,
              title: const TextWidget.body1("自定义ListView"),
              onTap: () => Loading.toast("当前列表就已经是自定义ListView了"),
            ),

            // 自定义GridView
            CustomCell(
              iconPath: AssetsSvgs.styleGridSvg,
              title: const TextWidget.body1("自定义GridView"),
              onTap: () => {},
            ),

            // 选择照片/拍照
            CustomCell(
              iconPath: AssetsSvgs.stylePhotoSvg,
              title: const TextWidget.body1("ImagePicker 选择照片/拍照"),
              onTap: () => {},
            ),

            // 验证码Pin
            CustomCell(
              iconPath: AssetsSvgs.stylePinSvg,
              title: const TextWidget.body1("Pin 验证码"),
              onTap: () => Get.toNamed(RouteNames.stylesPinRoute),
            ),
          ],
        ).card().padding(left: 0.w, right: 0.w, bottom: 40.h),
      ),
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
