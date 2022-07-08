import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class SystemPage extends GetView<SystemController> {
  const SystemPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return <Widget>[
      // 退出登录
      ButtonWidget.iconText(
        IconWidget.svg(
          AssetsSvgs.styleLogoutSvg,
          color: Colors.white,
          size: 25,
        ),
        LocaleKeys.profileLogout.tr,
        bgColor: Colors.red,
        iconTextSpace: 5,
        textColor: Colors.white,
        textSize: 20.sp,
        borderColor: Get.theme.colorScheme.outline.withOpacity(0.4),
        borderRadius: 10,
        onTap: controller.onLogout,
      ).height(50.w).padding(
            left: AppSpace.page,
            right: AppSpace.page,
            bottom: AppSpace.listRow * 2,
            top: AppSpace.listRow * 2,
          ),

      // 版权信息
      const TextWidget.body2(
        "Code by: https://github.com/Espero1995/base_framework",
      ).alignCenter().paddingBottom(AppSpace.listRow),

      // 版本号
      TextWidget.body2(
        "v ${ConfigService.to.version}",
      ).alignCenter().paddingBottom(100),
    ].toColumn();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SystemController>(
      init: SystemController(),
      id: "system",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.profileSetting.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
