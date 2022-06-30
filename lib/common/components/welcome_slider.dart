import 'package:base_framework/common/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// 欢迎Slider
class WelcomeSlider extends StatelessWidget {
  final List<WelcomeModel> items;
  final Function(int) onPageChanged;
  final CarouselController? carouselController;

  const WelcomeSlider(
    this.items, {
    Key? key,
    required this.onPageChanged,
    this.carouselController,
  }) : super(key: key);

  Widget sliderItem(WelcomeModel item) {
    return Builder(builder: (BuildContext context) {
      return <Widget>[
        // 图片
        if (item.image != null)
          ImageWidget.asset(
            item.image!,
            fit: BoxFit.cover,
          ).paddingBottom(50),

        // 标题
        if (item.title != null)
          TextWidget(
            text: item.title ?? "",
            maxLines: 2,
            softWrap: true,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'PTSerif',
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ).paddingBottom(20),

        // 描述
        if (item.desc != null)
          TextWidget.body1(
            item.desc ?? "",
            maxLines: 3,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
      ]
          .toColumn(mainAxisAlignment: MainAxisAlignment.center)
          .width(MediaQuery.of(context).size.width);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: 0.8.sh,
        viewportFraction: 1, // 充满
        enlargeCenterPage: false, // 动画 封面效果 在不好的手机上会出现一卡一卡的副作用
        enableInfiniteScroll: false, // 无限循环
        autoPlay: false, // 自动播放
        onPageChanged: (index, reason) => onPageChanged(index),
      ),
      items: <Widget>[
        for (var item in items) sliderItem(item),
      ].toList(),
    );
  }
}
