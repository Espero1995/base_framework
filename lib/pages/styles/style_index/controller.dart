import 'package:get/get.dart';

class StylesIndexController extends GetxController {
  StylesIndexController();

  String _title = "默认内容";
  set title(value) => _title = value;
  get title => _title;

  onTextChange(String str) {
    title = str;
    update(["style_index"]);
  }

  _initData() {
    update(["style_index"]);
  }

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

  // @override
  // void dispose() {
  //   super.dispose();
  // }
}
