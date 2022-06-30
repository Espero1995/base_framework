import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

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
    return <Widget>[
      ElevatedButton(
        onPressed: () {
          Get.toNamed(RouteNames.stylesIndexRoute);
        },
        child: const Text("Style"),
      ),
    ].toColumn(mainAxisAlignment: MainAxisAlignment.center).center();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      id: "main",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
