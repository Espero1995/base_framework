import 'package:badges/badges.dart';
import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 功能栏项
class BarItemWidget extends StatelessWidget {
  /// 标题
  final String title;

  /// svg本地路径
  final String svgPath;

  /// svg 颜色 默认系统色
  final Color? svgColor;

  /// 点击事件
  final void Function()? onTap;

  ///是否显示未读标记 默认false
  final bool isShowBadge;

  const BarItemWidget({
    Key? key,
    required this.title,
    required this.svgPath,
    this.svgColor,
    this.onTap,
    this.isShowBadge = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      // 图标
      IconWidget.svg(
        svgPath,
        size: 28.sp,
        color: svgColor ?? AppColors.primary,
      ),

      [
        // 标题
        TextWidget.body2(
          title,
        ),
        if (isShowBadge)
          Badge(
            elevation: 0,
            padding: const EdgeInsets.all(3.0),
          ).translate(offset: const Offset(0, -5)),
      ].toRow(),
    ].toColumn().onTap(onTap);
  }
}
