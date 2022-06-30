import 'package:base_framework/common/index.dart';
import 'package:flutter/material.dart';

// 页面标题 组件
class PageTitleWidget extends StatelessWidget {
  final String title, desc;
  const PageTitleWidget({
    Key? key,
    required this.title,
    required this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      TextWidget.title1(title),
      TextWidget.body2(desc),
    ]
        .toColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
        )
        .padding(
          left: 10,
          top: 10,
          bottom: 30,
        );
  }
}
