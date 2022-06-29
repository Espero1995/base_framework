import 'package:base_framework/common/styles/index.dart';
import 'package:flutter/material.dart';

/// slider indicator
class SliderIndicatorWidget extends StatelessWidget {
  final int length;
  final int currentIndex;
  final Color color;
  final bool isCircle;
  final MainAxisAlignment alignment;

  SliderIndicatorWidget({
    Key? key,
    required this.length,
    required this.currentIndex,
    Color? color,
    this.isCircle = false,
    this.alignment = MainAxisAlignment.center,
  })  : color = color ?? AppColors.primary,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: List.generate(length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: !isCircle
              ? currentIndex == index
                  ? 15.0
                  : 8
              : 6,
          height: !isCircle ? 4 : 6,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: currentIndex == index ? color : color.withOpacity(0.3),
          ),
        );
      }),
    );
  }
}
