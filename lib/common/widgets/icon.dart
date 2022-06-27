import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../index.dart';

/// 图标组件
class IconWidget extends StatelessWidget {
  final IconData? iconData;
  final Widget? icon;
  final double? size;
  final double? width;
  final double? height;
  final Color? color;
  final bool? isDot; // 是否小圆点
  final String? badgeString; // Badge 文字

  const IconWidget({
    Key? key,
    this.icon,
    this.size,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
  }) : super(key: key);

  IconWidget.icon(
    this.iconData, {
    Key? key,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.isDot,
    this.badgeString,
  })  : icon = Icon(
          iconData,
          size: size,
          color: color,
        ),
        super(key: key) {
    return;
  }

  IconWidget.image(
    String assetName, {
    Key? key,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
  })  : icon = Image.asset(
          assetName,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: BoxFit.contain,
        ),
        super(key: key) {
    return;
  }

  IconWidget.svg(
    String assetName, {
    Key? key,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
    BoxFit? fit,
  })  : icon = SvgPicture.asset(
          assetName,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: fit ?? BoxFit.contain,
        ),
        super(key: key) {
    return;
  }

  IconWidget.url(
    String url, {
    Key? key,
    this.size = 24,
    this.width,
    this.height,
    this.color,
    this.iconData,
    this.isDot,
    this.badgeString,
  })  : icon = Image.network(
          url,
          width: width ?? size,
          height: height ?? size,
          color: color,
          fit: BoxFit.contain,
        ),
        super(key: key) {
    return;
  }

  @override
  Widget build(BuildContext context) {
    // 圆点
    if (isDot == true) {
      return Badge(
        position: BadgePosition.bottomEnd(bottom: 0, end: -2),
        elevation: 0,
        badgeColor: AppColors.primary,
        padding: const EdgeInsets.all(4.0),
        child: icon ??
            Icon(
              iconData,
              size: size,
              color: color ?? AppColors.onPrimaryContainer,
            ),
      );
    }

    // 文字、数字
    if (badgeString != null) {
      return Badge(
        badgeContent: Text(
          badgeString!,
          style: TextStyle(
            color: AppColors.onPrimary,
            fontSize: 9,
          ),
        ),
        position: BadgePosition.topEnd(top: -7, end: -8),
        elevation: 0,
        badgeColor: AppColors.primary,
        padding: const EdgeInsets.all(4.0),
        child: icon ??
            Icon(
              iconData,
              size: size,
              color: color ?? AppColors.onPrimaryContainer,
            ),
      );
    }

    // 图标
    return icon ??
        Icon(
          iconData,
          size: size,
          color: color ?? AppColors.onPrimaryContainer,
        );
  }
}
