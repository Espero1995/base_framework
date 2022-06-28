import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputsController extends GetxController {
  InputsController();

  TextEditingController textController = TextEditingController(text: "输入框");
  TextEditingController textBorderController =
      TextEditingController(text: "带边框 > 输入框");
  TextEditingController textFilledController =
      TextEditingController(text: "填充 > 输入框");
  TextEditingController iconTextFilledController =
      TextEditingController(text: "图标 > 输入框");
  TextEditingController suffixTextFilledController =
      TextEditingController(text: "后缀图标 > 输入框");
  TextEditingController searchController = TextEditingController();

  bool checkVal = true;
  void onCheckBox(bool val) {
    checkVal = val;
    update(['inputs']);
  }

  _initData() {
    update(["inputs"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  @override
  void dispose() {
    super.dispose();
    //需要销毁
    textController.dispose();
    textBorderController.dispose();
    textFilledController.dispose();
    iconTextFilledController.dispose();
    suffixTextFilledController.dispose();
    searchController.dispose();
  }
}
