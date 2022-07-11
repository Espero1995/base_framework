import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// cell group
class CustomCellGroup extends StatelessWidget {
  final List<Widget> children;
  final double? minHeight;
  final bool showDivider;

  const CustomCellGroup({
    Key? key,
    this.children = const [],
    this.minHeight,
    this.showDivider = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cellLists = <Widget>[];
    for (var index = 0; index < children.length; index++) {
      if (index != 0 && showDivider) cellLists.add(Divider(height: 1.w));
      cellLists.add(
        ConstrainedBox(
          constraints: BoxConstraints(minHeight: minHeight ?? 64.w),
          child: children[index],
        ),
      );
    }
    return cellLists
        .toColumn(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        )
        .padding(left: 15.w, right: 15.w);
  }
}

class CustomCell extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final String? iconPath;
  final Color? iconColor;
  final Widget? value;
  final bool? showArrow;
  final double? valueWidth;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final EdgeInsets? padding;
  final Widget? trailing;
  final void Function()? onTap;

  const CustomCell({
    Key? key,
    required this.title,
    this.subtitle,
    this.iconPath,
    this.iconColor,
    this.value,
    this.showArrow,
    this.valueWidth,
    this.onTap,
    this.titleStyle,
    this.valueStyle,
    this.padding,
    this.trailing,
  }) : super(key: key);

  /// 简单的cell风格
  factory CustomCell.simple({
    Key? key,
    required Widget title,
    Widget? value,
    EdgeInsets? padding,
  }) = _CellWithSimple;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final cellItems = <Widget>[];
    if (iconPath != null) {
      // 图标
      cellItems.add(
        IconTheme(
          data: IconThemeData(
            color: colorScheme.primary,
            size: 26.w,
          ),
          child: IconWidget.svg(
            iconPath!,
            color: iconColor ?? AppColors.primary,
            size: 24.w,
          ),
        ),
      );
      // 图标和标题间的间隔
      cellItems.add(SizedBox(width: 15.w));
    }
    // 标题
    cellItems.add(
      Expanded(
        // 文本的样式默认是可以被继承
        child: <Widget>[
          DefaultTextStyle.merge(
            child: title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 17.w,
            ),
          ).translate(
            offset: Offset(0, -1.5.h),
          ),
          // 副标题
          if (subtitle != null)
            SizedBox(
                child: DefaultTextStyle.merge(
                    child: subtitle!,
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 15.w,
                    )))
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
      ),
    );

    // 值value
    if (value != null) {
      cellItems.add(SizedBox(width: 12.w));
      cellItems.add(Container(
        constraints: BoxConstraints(maxWidth: valueWidth ?? double.infinity),
        alignment: Alignment.centerRight,
        child: DefaultTextStyle.merge(
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 16.w,
            color: colorScheme.onBackground.withOpacity(0.7),
          ).merge(valueStyle),
          child: value!,
        ),
      ));
    }
    // 右侧组件
    if (trailing != null) {
      cellItems.add(SizedBox(width: 8.w));
      cellItems.add(trailing!);
    }

    // 点击事件以及箭头
    if (onTap != null && showArrow != false) {
      cellItems.add(SizedBox(width: 8.w));
      cellItems.add(Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16.w,
        color: colorScheme.primary,
      ));
    }

    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(vertical: 10.w),
        child: cellItems.toRow(crossAxisAlignment: CrossAxisAlignment.center),
      ),
    );
  }
}

class _CellWithSimple extends CustomCell {
  _CellWithSimple({
    Key? key,
    required Widget title,
    Widget? value,
    EdgeInsets? padding,
  }) : super(
          key: key,
          title: title,
          value: value,
          titleStyle: TextStyle(fontSize: 18.w),
          valueStyle: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
            fontSize: 18.w,
          ),
          padding: padding,
        );
}
