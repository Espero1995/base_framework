import 'package:flutter/material.dart';

/// 导航栏数据模型
class NavigationItemModel {
  final String label;
  final String icon;
  final int count;

  NavigationItemModel({
    required this.label,
    required this.icon,
    this.count = 0,
  });
}

/// 导航栏
class BuildNavigation extends StatelessWidget {
  // final int currentIndex;

  const BuildNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
