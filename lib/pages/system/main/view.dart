import 'package:base_framework/common/index.dart';
import 'package:base_framework/pages/index.dart';
import 'package:base_framework/pages/system/main/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/*
  首页
  - 底部导航 navigation
  - 内容页 pageView
*/
class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _MainViewGetX();
  }
}

class _MainViewGetX extends GetView<MainController> {
  const _MainViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    DateTime? _lastPressedAt;
    return WillPopScope(
      // 用于安卓底部的返回按钮，防止连续点击两次退出应用
      onWillPop: () async {
        if (_lastPressedAt == null ||
            DateTime.now().difference(_lastPressedAt!) >
                const Duration(seconds: 1)) {
          //两次点击间隔超过1秒则重新计时
          _lastPressedAt = DateTime.now();
          Loading.toast(LocaleKeys.commonExitApp.tr);
          return false;
        }
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        return true;
      },

      child: Scaffold(
        // 如果为true，并且指定了bottomNavigationBar或persistentFooterButtons，则body将延伸到Scaffold的底部，而不是仅延伸到bottomNavigationBar或persistentFooterButtons的顶部
        extendBody: true,
        // 可以通过设置 这个属性 防止键盘 覆盖内容 或者 键盘 撑起内容
        resizeToAvoidBottomInset: false,
        // 底部工具栏
        bottomNavigationBar: GetBuilder<MainController>(
          id: 'navigation',
          builder: (_) {
            return BuildNavigation(
              currentIndex: controller.currentIndex,
              items: [
                NavigationItemModel(
                  label: LocaleKeys.tabBarHome.tr,
                  icon: AssetsSvgs.tabHomeSvg,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarPattern.tr,
                  icon: AssetsSvgs.tabPatternSvg,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarMessage.tr,
                  icon: AssetsSvgs.tabMessageSvg,
                  count: 99,
                ),
                NavigationItemModel(
                  label: LocaleKeys.tabBarProfile.tr,
                  icon: AssetsSvgs.tabProfileSvg,
                )
              ],
              onTap: controller.onJumpToPage, // 切换tab事件
            );
          },
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(), // 不响应用户的滚动
          controller: controller.pageController,
          onPageChanged: controller.onIndexChanged,
          children: const [
            HomePage(),
            PatternPage(),
            MessagePage(),
            MyPage(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return _buildView();
      },
    );
  }
}
