import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Loading {
  static const int _milliseconds = 1000; // 提示 延迟毫秒，提升体验 秒关体验太差
  static const int _dismissMilliseconds = 1500; // dismisss 延迟毫秒

  Loading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: _dismissMilliseconds)
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 35.0
      ..lineWidth = 2
      ..radius = 10.0
      ..progressColor = Colors.white
      ..backgroundColor = Colors.black.withOpacity(0.7)
      ..indicatorColor = Colors.white
      ..textColor = Colors.white
      ..maskColor = Colors.black.withOpacity(0.7)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

  /// show Loading
  static void show({
    String? text,
    Color? indicatorColor,
    Color? textColor,
  }) {
    EasyLoading.instance
      ..indicatorColor = indicatorColor ?? Colors.white
      ..textColor = textColor ?? Colors.white;
    EasyLoading.instance.userInteractions = false; // 屏蔽交互操作
    EasyLoading.show(status: text ?? LocaleKeys.commonDefaultLoadingMsg.tr);
  }

  /// show Success
  static void success({
    String? text,
    Color? indicatorColor,
    Color? textColor,
  }) {
    EasyLoading.instance
      ..indicatorColor = indicatorColor ?? Colors.green
      ..textColor = textColor ?? Colors.white;
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
      () => EasyLoading.showSuccess(
          text ?? LocaleKeys.commonSuccessLoadingMsg.tr),
    );
  }

  /// show Error
  static void error({
    String? text,
    Color? indicatorColor,
    Color? textColor,
  }) {
    EasyLoading.instance
      ..indicatorColor = indicatorColor ?? Colors.red
      ..textColor = textColor ?? Colors.white;
    Future.delayed(
      const Duration(milliseconds: _milliseconds),
      () => EasyLoading.showError(
        text ?? LocaleKeys.commonErrorLoadingMsg.tr,
      ),
    );
  }

  /// toast
  static void toast(String text) {
    EasyLoading.instance.textColor = Colors.white;
    EasyLoading.showToast(text);
  }

  /// dismiss
  static Future<void> dismiss() async {
    await Future.delayed(
      const Duration(milliseconds: _dismissMilliseconds),
      () {
        EasyLoading.instance.userInteractions = true; // 恢复交互操作
        EasyLoading.dismiss();
      },
    );
  }
}
