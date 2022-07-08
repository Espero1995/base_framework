import 'package:base_framework/common/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  List<WelcomeModel>? items; // 滚动集合
  int currentIndex = 0; // 当前项
  bool isShowStart = false; // 是否显示 Start
  CarouselController carouselController = CarouselController(); // slider 控制器

  void onPageChanged(int index) {
    currentIndex = index;
    isShowStart = currentIndex == 2;
    update(["slider", "bar"]);
  }

  // 跳转到主界面
  void onToMain() async {
    // Get.offAllNamed(RouteNames.systemLoginRoute);
    if (await UserService.to.checkIsLogin()) {
      Get.offAllNamed(RouteNames.mainRoute);
    }
  }

  // 跳转到下一个页面
  void onNext() {
    carouselController.nextPage();
  }

  _initData() {
    items = [
      WelcomeModel(
        image: 'assets/images/welcome_1.jpg',
        title: 'Plentiful UI Design',
        desc: 'This is a set of flat UI framework design.',
      ),
      WelcomeModel(
        image: 'assets/images/welcome_2.jpg',
        title: 'Clean Coding',
        desc: 'Clarity structure, user-friendly code style.',
      ),
      WelcomeModel(
        image: 'assets/images/welcome_3.jpg',
        title: 'Flutter 3 is Coming',
        desc:
            'This is the nestest Flutter version. Single Code Base for 6 Platforms.',
      ),
    ];

    update(["slider"]);
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    ConfigService().setAlreadyOpen(); //标记下已经打开过了
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
