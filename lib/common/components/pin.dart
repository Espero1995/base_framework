import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

/// pin 输入框
class PinPutWidget extends StatelessWidget {
  /// 提交事件
  final Function(String)? onSubmit;

  /// 焦点
  final FocusNode? focusNode;

  /// 文本编辑控制器
  final TextEditingController? controller;

  /// 验证函数
  final String? Function(String?)? validator;

  const PinPutWidget({
    Key? key,
    this.onSubmit,
    this.focusNode,
    this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 默认
    final defaultPinTheme = PinTheme(
      width: 45,
      height: 45,
      textStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.1,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.surfaceVariant, width: 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
    );

    // 编辑
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary, width: 2.0),
      borderRadius: BorderRadius.circular(10),
    );
    // 完成
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: AppColors.surfaceVariant,
      ),
    );

    return Pinput(
      defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
      submittedPinTheme: submittedPinTheme,
      length: 6,
      validator: validator,
      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
      showCursor: true,
      autofocus: true,
      obscureText: false,
      keyboardAppearance: Brightness.light,
      focusNode: focusNode,
      controller: controller,
      onCompleted: onSubmit,
    );
  }
}
