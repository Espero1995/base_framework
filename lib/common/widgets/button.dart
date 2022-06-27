import 'package:flutter/material.dart';
import '../index.dart';

/// 按钮
class ButtonWidget extends StatelessWidget {
  /// tap 事件
  final Function()? onTap;

  /// 文字字符串
  final String? text;

  /// 文字尺寸
  final double? textSize;

  /// 文字颜色
  final Color? textColor;

  /// 文字 weight
  final FontWeight? textWeight;

  /// 文字组件
  final Widget? textWidget;

  /// 图标组件
  final Widget? icon;

  /// 背景色
  final Color? bgColor;

  /// 边框色
  final Color? borderColor;

  /// 边框圆角
  final double? borderRadius;

  /// 图标文字间距
  final double? iconTextSpace;

  /// 文字方向 左->右 ，右->左
  final TextDirection? textDirection;

  /// 方式排列 column
  final bool? isColumn;

  /// 是否反转
  final bool? reversed;

  /// 主轴对齐方式
  final MainAxisAlignment? mainAxisAlignment;

  const ButtonWidget({
    Key? key,
    this.onTap,
    this.text,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.textWidget,
    this.bgColor,
    this.borderColor,
    this.icon,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
    this.borderRadius,
    this.reversed,
    this.mainAxisAlignment,
  }) : super(key: key);

  /// 图标
  const ButtonWidget.icon(
    this.icon, {
    Key? key,
    this.onTap,
    this.textColor,
    this.text,
    this.bgColor,
    this.borderColor,
    this.textWidget,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
    this.borderRadius,
    this.reversed,
    this.mainAxisAlignment,
  }) : super(key: key);

  /// 图标
  const ButtonWidget.iconText(
    this.icon,
    this.text, {
    Key? key,
    this.onTap,
    this.textColor,
    this.bgColor,
    this.borderColor,
    this.textWidget,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
    this.borderRadius,
    this.reversed,
    this.mainAxisAlignment,
  }) : super(key: key);

  /// 主要
  ButtonWidget.primary(
    String textString, {
    Key? key,
    this.onTap,
    this.icon,
    this.text,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
    double? borderRadius,
    this.borderColor,
    this.reversed,
    this.mainAxisAlignment,
  })  : borderRadius = borderRadius ?? AppRadius.button,
        textWidget = TextWidget.button(
          text: textString,
          color: AppColors.onPrimary,
        ),
        bgColor = AppColors.primary,
        super(key: key);

  /// 次要
  ButtonWidget.secondary(
    String textString, {
    Key? key,
    this.onTap,
    this.icon,
    this.text,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
    double? borderRadius,
    this.reversed,
    this.mainAxisAlignment,
  })  : borderRadius = borderRadius ?? AppRadius.button,
        textWidget = TextWidget.button(
          text: textString,
          color: AppColors.primary,
        ),
        bgColor = AppColors.onSecondary,
        borderColor = AppColors.outline,
        super(key: key);

  /// 文字
  const ButtonWidget.text(
    this.text, {
    Key? key,
    this.onTap,
    this.textColor,
    this.icon,
    this.bgColor,
    this.borderColor,
    this.textWidget,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
    this.borderRadius,
    this.reversed,
    this.mainAxisAlignment,
  }) : super(key: key);

  /// 文字/填充
  ButtonWidget.textFilled(
    String textString, {
    Key? key,
    Color? bgColor,
    this.onTap,
    this.icon,
    this.text,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
    this.borderColor,
    this.borderRadius,
    this.reversed,
    this.mainAxisAlignment,
  })  : bgColor = bgColor ?? AppColors.primary,
        textWidget = TextWidget.button(
          text: textString,
          size: textSize,
          color: textColor ?? AppColors.onPrimary,
        ),
        super(key: key);

  /// 文字/填充/圆形 按钮
  ButtonWidget.textRoundFilled(
    String textString, {
    Key? key,
    Color? bgColor,
    double? borderRadius,
    this.onTap,
    this.icon,
    this.text,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.iconTextSpace,
    this.textDirection,
    this.isColumn,
    this.borderColor,
    this.reversed,
    this.mainAxisAlignment,
  })  : bgColor = bgColor ?? AppColors.primary,
        borderRadius = borderRadius ?? AppRadius.button,
        textWidget = TextWidget.button(
          text: textString,
          size: textSize,
          weight: textWeight ?? FontWeight.w500,
          color: textColor ?? AppColors.onPrimary,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // 组件列表
    List<Widget> btns = [];
    // 图标
    if (icon != null) {
      btns.add(icon!.paddingRight(iconTextSpace ?? AppSpace.iconTextSmail));
    }
    // 文字
    if (text != null) {
      btns.add(
        TextWidget.body2(
          text!,
          size: textSize,
          color: textColor,
          weight: textWeight ?? FontWeight.w400,
        ).padding(all: AppSpace.button),
      );
    }
    // 文字组件
    else if (textWidget != null) {
      btns.add(textWidget!);
    }

    // 反转
    if (reversed == true) {
      btns = List<Widget>.from(btns.reversed);
    }

    // 横向、纵向
    Widget ws;
    if (isColumn == true) {
      ws = btns.toColumn(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        textDirection: textDirection,
      );
    } else {
      ws = btns.toRow(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
        textDirection: textDirection,
      );
    }

    return ws
        .inkWell(
          borderRadius: borderRadius,
          onTap: onTap,
        )
        .decorated(
          color: bgColor,
          border: borderColor != null
              ? Border.all(
                  color: borderColor ?? AppColors.primary,
                )
              : null,
          borderRadius: borderRadius != null
              ? BorderRadius.all(
                  Radius.circular(borderRadius ?? AppRadius.button),
                )
              : null,
        );
  }
}
