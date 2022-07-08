import 'dart:ui';

import 'package:badges/badges.dart';
import 'package:base_framework/common/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:launch_review/launch_review.dart';
import 'package:lottie/lottie.dart';

import 'index.dart';
import 'widgets/bar_item.dart';

class MyPage extends GetView<MyController> {
  const MyPage({Key? key}) : super(key: key);

  // 顶部App导航栏
  Widget _buildAppBar() {
    return SliverAppBar(
      // 标题
      // title: Text(LocaleKeys.tabBarProfile.tr),
      // 背景色
      backgroundColor: AppColors.primary,
      // 固定在顶部
      pinned: true,
      // 是否应拉伸以填充过度滚动区域
      stretch: true,
      // 高度
      expandedHeight: 250.h,
      // 此小组件堆叠在工具栏和选项卡栏后面。其高度将与应用栏的整体高度相同
      flexibleSpace: FlexibleSpaceBar(
        background: <Widget>[
          // 背景图
          <Widget>[
            // IconWidget.svg(
            //   AssetsSvgs.tabMessageSvg,
            //   color: AppColors.primaryContainer,
            //   fit: BoxFit.cover,
            // ).expanded(),
            Lottie.asset(AssetsLotties.profileJson).expanded(),
          ].toColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),

          // 内容
          <Widget>[
            // 用户信息
            <Widget>[
              // 头像
              ImageWidget.asset(
                // 测试需要改成自定义头像
                AssetsImages.defaultPng,
                width: 80.w,
                height: 80.w,
                fit: BoxFit.fill,
                radius: 40.w,
              ).paddingRight(AppSpace.listItem),
              // 称呼
              TextWidget.title1(
                "${UserService.to.profile.account}",
                color: Colors.grey,
                size: 20.sp,
              ),
            ].toRow().paddingHorizontal(AppSpace.card),

            // 功能栏位
            <Widget>[
              //  版本更新
              BarItemWidget(
                title: LocaleKeys.profileVersionUpdate.tr,
                svgColor: Colors.green,
                svgPath: AssetsSvgs.styleUpdateSvg,
                isShowBadge: true,
                onTap: () {
                  LaunchReview.launch(
                    writeReview: false,
                    androidAppId: 'xxxxx',
                    iOSAppId: "1462030330",
                  );
                },
              ),

              //  样式
              BarItemWidget(
                title: LocaleKeys.profileStyle.tr,
                svgColor: AppColors.primary,
                svgPath: AssetsSvgs.styleStyleSvg,
                onTap: () => Get.toNamed(RouteNames.stylesIndexRoute),
              ),
              //  Q&A 嵌入web
              BarItemWidget(
                title: LocaleKeys.profileQA.tr,
                svgColor: Colors.red,
                svgPath: AssetsSvgs.styleVersionSvg,
              ),
            ]
                .toRow(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                )
                .paddingAll(AppSpace.card)
                .frostedCard()
                .paddingHorizontal(AppSpace.page),
          ].toColumn(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
        ].toStack(),
      ),
      actions: [
        //设置按钮
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Get.toNamed(RouteNames.mySystemRoute),
        ),
      ],
    );
  }

  // 按钮 list view
  Widget _buildButtonLists() {
    final ws = <Widget>[];
    ws.add(
      SizedBox(
        height: 20.w,
      ),
    );
    ws.add(
      CustomCellGroup(
        children: [
          // 国际化
          CustomCell(
            iconPath: AssetsSvgs.styleLanguageSvg,
            title: Text(LocaleKeys.profileLanguage.tr),
            value: Text(ConfigService.to.locale.toLanguageTag() == 'zh-CN'
                ? LocaleKeys.profileChinese.tr
                : LocaleKeys.profileEnglish.tr),
            onTap: () => controller.onLanguageSelected(),
          ),

          // 外观主题
          CustomCell(
            iconPath: AssetsSvgs.styleThemeStyleSvg,
            iconColor: Colors.green,
            title: Text(LocaleKeys.profileTheme.tr),
            trailing: ConfigService.to.isDarkMode
                ? IconWidget.svg(
                    AssetsSvgs.styleThemeDarkSvg,
                    color: const Color.fromRGBO(82, 45, 162, 1),
                  )
                : IconWidget.svg(
                    AssetsSvgs.styleThemeLightSvg,
                    color: const Color.fromRGBO(251, 194, 27, 1),
                  ),
            onTap: () => controller.onThemeSelected(),
          ),
          // 欢迎页
          GetBuilder<MyController>(
            init: MyController(),
            id: "welcome",
            builder: (_) {
              return CustomCell(
                iconPath: AssetsSvgs.styleSplashSvg,
                iconColor: Colors.orange,
                title: Text(LocaleKeys.profileWelcome.tr),
                trailing: CupertinoSwitch(
                    value: controller.isFirstOpenChecked,
                    onChanged: (v) {
                      controller.isFirstOpenChecked = v;
                    }),
              );
            },
          ),
        ],
      ).card(),
    );

    return ws
        .toColumn()
        .padding(left: 10.w, right: 10.w, bottom: 40.h)
        .sliverBox;
  }

  // 主视图
  Widget _buildView() {
    return CustomScrollView(
      slivers: <Widget>[
        //顶部App导航栏
        _buildAppBar(),

        // 按钮 listView
        _buildButtonLists(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyController>(
      init: MyController(),
      id: "my",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            toolbarHeight: 0,
            backgroundColor: AppColors.primary,
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
