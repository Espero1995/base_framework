import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

enum CustomButtonType { filled, ghost, borderless }
enum CustomButtonSize { large, medium, small }
enum CustomButtonShape { radius, stadium }

class CustomButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final CustomButtonType type;
  final CustomButtonSize size;
  final CustomButtonShape shape;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final bool isIcon;

  const CustomButton({
    Key? key,
    required this.child,
    this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    this.type = CustomButtonType.filled,
    this.size = CustomButtonSize.medium,
    this.shape = CustomButtonShape.radius,
    this.width,
    this.height,
    this.padding,
    this.isIcon = false,
  }) : super(key: key);

  factory CustomButton.icon({
    Key? key,
    required Icon icon,
    void Function()? onPressed,
    Color? foregroundColor,
    Color? backgroundColor,
    CustomButtonShape shape,
    CustomButtonSize size,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
  }) = _ButtonWithIcon;

  OutlinedBorder? get _shape {
    switch (shape) {
      case CustomButtonShape.stadium:
        return const StadiumBorder();
      case CustomButtonShape.radius:
        return RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.w),
        );
    }
  }

  EdgeInsetsGeometry? get _padding {
    switch (size) {
      case CustomButtonSize.large:
        return EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.w);
      case CustomButtonSize.medium:
        return EdgeInsets.symmetric(horizontal: 16.w, vertical: 13.w);
      case CustomButtonSize.small:
        return EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w);
    }
  }

  double? get _fontSize {
    switch (size) {
      case CustomButtonSize.large:
        return 18.w;
      case CustomButtonSize.medium:
        return 16.w;
      case CustomButtonSize.small:
        return 14.w;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      height: height,
      child: OutlinedButton(
        onPressed: onPressed,
        child: child,
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            Theme.of(context).textTheme.button?.copyWith(fontSize: _fontSize),
          ),
          padding: MaterialStateProperty.all(padding ?? _padding),
          foregroundColor: MaterialStateProperty.resolveWith((states) {
            switch (type) {
              case CustomButtonType.filled:
                return foregroundColor ??
                    (isIcon ? colorScheme.primary : colorScheme.onPrimary);
              case CustomButtonType.ghost:
              case CustomButtonType.borderless:
                final color = foregroundColor ?? colorScheme.primary;
                final opacity = color.opacity / 2;
                if (states.contains(MaterialState.pressed)) {
                  return color.withOpacity(opacity);
                }
                if (states.contains(MaterialState.disabled)) {
                  return color.withOpacity(opacity);
                }
                return color;
            }
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            switch (type) {
              case CustomButtonType.filled:
                final color = backgroundColor ??
                    colorScheme.primary.withOpacity(isIcon ? 0.1 : 1);
                final opacity = color.opacity / 2;
                if (states.contains(MaterialState.pressed)) {
                  return color.withOpacity(opacity);
                }
                if (states.contains(MaterialState.disabled)) {
                  return color.withOpacity(opacity);
                }
                return color;
              case CustomButtonType.ghost:
              case CustomButtonType.borderless:
                return Colors.transparent;
            }
          }),
          side: MaterialStateProperty.resolveWith((states) {
            switch (type) {
              case CustomButtonType.filled:
              case CustomButtonType.borderless:
                return BorderSide.none;
              case CustomButtonType.ghost:
                final color = foregroundColor ?? colorScheme.primary;
                final opacity = color.opacity / 2;
                if (states.contains(MaterialState.pressed)) {
                  return BorderSide(
                    color: color.withOpacity(opacity),
                    width: 2.w,
                  );
                }
                if (states.contains(MaterialState.disabled)) {
                  return BorderSide(color: color.withOpacity(opacity));
                }
                return BorderSide(
                  color: color,
                  width: 2.w,
                );
            }
          }),
          shape: MaterialStateProperty.all(_shape),
        ),
      ),
    );
  }
}

class _ButtonWithIcon extends CustomButton {
  final Icon icon;

  _ButtonWithIcon({
    Key? key,
    required this.icon,
    void Function()? onPressed,
    Color? foregroundColor,
    Color? backgroundColor,
    CustomButtonType type = CustomButtonType.filled,
    CustomButtonSize size = CustomButtonSize.medium,
    CustomButtonShape shape = CustomButtonShape.radius,
    double? width,
    double? height,
    EdgeInsetsGeometry? padding,
  }) : super(
          key: key,
          child: _ButtonWithIconChild(
            icon: icon,
            size: size,
            padding: padding,
          ),
          onPressed: onPressed,
          foregroundColor: foregroundColor,
          backgroundColor: backgroundColor ?? foregroundColor?.withOpacity(0.1),
          type: type,
          size: size,
          shape: shape,
          width: width,
          height: height,
          isIcon: true,
          padding: padding ?? const EdgeInsets.all(0),
        );
}

class _ButtonWithIconChild extends StatelessWidget {
  final Icon icon;
  final CustomButtonSize size;
  final EdgeInsetsGeometry? padding;

  const _ButtonWithIconChild({
    Key? key,
    required this.icon,
    required this.size,
    this.padding,
  }) : super(key: key);

  double? get _iconSize {
    switch (size) {
      case CustomButtonSize.large:
        return 30.w;
      case CustomButtonSize.medium:
        return 24.w;
      case CustomButtonSize.small:
        return 18.w;
    }
  }

  double get _padding {
    switch (size) {
      case CustomButtonSize.large:
        return 12.w;
      case CustomButtonSize.medium:
        return 10.w;
      case CustomButtonSize.small:
        return 8.w;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding == null ? EdgeInsets.all(_padding) : const EdgeInsets.all(0),
      child: IconTheme.merge(
        data: IconThemeData(size: _iconSize),
        child: icon,
      ),
    );
  }
}
