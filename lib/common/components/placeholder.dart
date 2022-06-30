import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

/// 占位图组件
class PlaceholderWidget extends StatelessWidget {
  // 资源图片地址
  final String? assetImagePath;
  // 描述信息
  final String? desc;

  const PlaceholderWidget({
    Key? key,
    this.assetImagePath,
    this.desc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return <Widget>[
      ImageWidget.asset(assetImagePath ?? AssetsImages.placeholderPng),
      TextWidget.body1(desc ?? LocaleKeys.commonNoData.tr, color: Colors.grey)
          .paddingTop(20),
    ]
        .toColumn(mainAxisAlignment: MainAxisAlignment.center)
        .center()
        .paddingHorizontal(AppSpace.page);
  }
}
