import 'package:base_framework/common/index.dart';
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

  // 多语言
  onLanguageSelected() {
    var en = Translation.supportedLocales[0];
    var zh = Translation.supportedLocales[1];

    ConfigService.to.setLanguage(
        ConfigService.to.locale.toLanguageTag() == en.toLanguageTag()
            ? zh
            : en);
  }

  // 主题
  onThemeSelected() async {
    await ConfigService.to.setThemeMode();
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
