import 'package:flutter/material.dart';

import '../index.dart';

/// 分组列表组件
/// KeyValueModel key 值， value 显示
class GroupListWidget extends StatelessWidget {
  final List<Widget> items; // 项目列表
  final double spacing;
  final double runSpacing;

  const GroupListWidget({
    Key? key,
    required this.items,
    this.spacing = 0,
    this.runSpacing = 0,
  }) : super(key: key);

  /// 颜色
  factory GroupListWidget.colors({
    Key? key,
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> itemList,
    required List<String> values,
    double? size,
    Color? borderSelectedColor,
    double? spacing,
    double? runSpacing,
  }) = _ColorsGroup;

  /// 尺寸
  factory GroupListWidget.sizes({
    Key? key,
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> itemList,
    required List<String> values,
    double? size,
    Color? bgColor,
    Color? bgSelectedColor,
    double? spacing,
    double? runSpacing,
  }) = _SizesGroup;

  /// 标签
  factory GroupListWidget.tags({
    Key? key,
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> itemList,
    required List<String> values,
    double? width,
    double? height,
    double? radius,
    Color? bgColor,
    Color? bgSelectedColor,
    // Color? borderSelectedColor,
    double? spacing,
    double? runSpacing,
  }) = _TagsGroup;

  /// 星级
  factory GroupListWidget.stars({
    Key? key,
    Function(int value)? onTap,
    required int starNum,
    required int value,
    IconData? iconData,
    double? size,
    Color? color,
    Color? selectedColor,
    double? spacing,
    double? runSpacing,
  }) = _StarsGroup;

  @override
  Widget build(BuildContext context) {
    return items.toWrap(
      spacing: spacing,
      runSpacing: runSpacing,
    );
  }
}

/// 颜色
class _ColorsGroup extends GroupListWidget {
  _ColorsGroup({
    Key? key,
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> itemList,
    required List<String> values,
    double? size,
    Color? borderSelectedColor,
    double? spacing,
    double? runSpacing,
  }) : super(
          key: key,
          spacing: spacing ?? 8,
          runSpacing: runSpacing ?? 5,
          items: itemList.map((item) {
            return SizedBox(
              width: size ?? 24,
              height: size ?? 24,
            )
                .decorated(
                  color: item.key.toColor,
                  border: values.hasValue(item.key) == true
                      ? Border.all(
                          color: borderSelectedColor ?? AppColors.highlight,
                          width: 2,
                        )
                      : null,
                  borderRadius: BorderRadius.all(
                    Radius.circular(size ?? 24 / 2),
                  ),
                )
                .tight(width: size, height: size)
                .gestures(
                  onTap: onTap != null
                      ? () {
                          if (values.hasValue(item.key)) {
                            values.remove(item.key);
                          } else {
                            values.add(item.key);
                          }
                          onTap(values);
                        }
                      : null,
                );
          }).toList(),
        );
}

/// 尺寸
class _SizesGroup extends GroupListWidget {
  _SizesGroup({
    Key? key,
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> itemList,
    required List<String> values,
    double? size,
    Color? bgColor,
    Color? bgSelectedColor,
    double? spacing,
    double? runSpacing,
  }) : super(
          key: key,
          spacing: spacing ?? 8,
          runSpacing: runSpacing ?? 5,
          items: itemList.map((item) {
            return TextWidget.body3(
              item.value,
              color: values.hasValue(item.key) == true
                  ? AppColors.onPrimary
                  : AppColors.secondary,
            )
                .center()
                .decorated(
                  color: values.hasValue(item.key) == true
                      ? bgSelectedColor ?? AppColors.highlight
                      : bgColor ?? AppColors.surfaceVariant.withOpacity(0.5),
                  border: null,
                  borderRadius: BorderRadius.all(
                    Radius.circular(size ?? 24 / 2),
                  ),
                )
                .tight(width: size, height: size)
                .gestures(
                  onTap: onTap != null
                      ? () {
                          if (values.hasValue(item.key)) {
                            values.remove(item.key);
                          } else {
                            values.add(item.key);
                          }
                          onTap(values);
                        }
                      : null,
                );
          }).toList(),
        );
}

/// 标签
class _TagsGroup extends GroupListWidget {
  _TagsGroup({
    Key? key,
    Function(List<String> values)? onTap,
    required List<KeyValueModel<String>> itemList,
    required List<String> values,
    double? width,
    double? height,
    double? radius,
    Color? bgColor,
    Color? bgSelectedColor,
    // Color? borderSelectedColor,
    double? spacing,
    double? runSpacing,
  }) : super(
          key: key,
          spacing: spacing ?? 8,
          runSpacing: runSpacing ?? 5,
          items: itemList.map((item) {
            return TextWidget.body3(
              item.value,
              color: values.hasValue(item.key) == true
                  ? AppColors.onPrimary
                  : AppColors.secondary,
            )
                .center()
                .decorated(
                  color: values.hasValue(item.key) == true
                      ? bgSelectedColor ?? AppColors.highlight
                      : bgColor ?? AppColors.surfaceVariant.withOpacity(0.5),
                  // border: values.hasValue(item.key) == true
                  //     ? Border.all(
                  //         color: borderSelectedColor ?? AppColors.outline,
                  //         width: 1,
                  //       )
                  //     : null,
                  borderRadius: BorderRadius.all(
                    Radius.circular(radius ?? 11),
                  ),
                )
                .tight(width: width ?? 90, height: height ?? 18)
                .gestures(
                  onTap: onTap != null
                      ? () {
                          if (values.hasValue(item.key)) {
                            values.remove(item.key);
                          } else {
                            values.add(item.key);
                          }
                          onTap(values);
                        }
                      : null,
                );
          }).toList(),
        );
}

/// 星级
class _StarsGroup extends GroupListWidget {
  _StarsGroup({
    Key? key,
    Function(int value)? onTap,
    required int starNum,
    required int value,
    IconData? iconData,
    double? size,
    Color? color,
    Color? selectedColor,
    double? spacing,
    double? runSpacing,
  }) : super(
          key: key,
          spacing: spacing ?? 5,
          runSpacing: runSpacing ?? 5,
          items: [
            for (var i = 1; i <= starNum; i++)
              IconWidget.icon(
                iconData ?? Icons.star,
                size: size ?? 12,
                color: i <= value
                    ? selectedColor ?? AppColors.highlight
                    : color ?? AppColors.surfaceVariant.withOpacity(0.5),
              ).onTap(onTap != null
                  ? () {
                      if (value == 1 && i == value) {
                        onTap(0);
                      } else {
                        onTap(i);
                      }
                    }
                  : null),
          ],
        );
}
