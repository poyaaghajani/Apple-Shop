import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:flutter/material.dart';

class CustomCircle extends StatelessWidget {
  const CustomCircle({super.key, required this.widget});

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleItem(
          heght: DevSize.getHeight(context) / 2.36,
          width: DevSize.getWidth(context) / 1.15,
          color: const Color.fromARGB(255, 106, 193, 251),
        ),
        CircleItem(
          heght: DevSize.getHeight(context) / 2.86,
          width: DevSize.getWidth(context) / 1.4,
          color: const Color.fromARGB(255, 121, 200, 252),
        ),
        CircleItem(
          heght: DevSize.getHeight(context) / 3.56,
          width: DevSize.getWidth(context) / 1.74,
          color: const Color.fromARGB(255, 153, 214, 254),
        ),
        CircleItem(
          heght: DevSize.getHeight(context) / 4.77,
          width: DevSize.getWidth(context) / 2.3,
          color: const Color.fromARGB(255, 227, 241, 250),
        ),
        widget
      ],
    );
  }
}

class CircleItem extends StatelessWidget {
  const CircleItem({
    super.key,
    required this.heght,
    required this.width,
    required this.color,
  });

  final double heght;
  final double width;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heght,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.2),
      ),
    );
  }
}
