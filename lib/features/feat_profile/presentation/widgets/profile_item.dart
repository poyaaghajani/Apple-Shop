import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.widget,
    required this.text,
    required this.onTap,
  });

  final Widget widget;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: DevSize.getHeight(context) / 14,
            width: DevSize.getWidth(context) / 6.8,
            decoration: ShapeDecoration(
              color: CustomColors.blue,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(45),
              ),
            ),
            child: Center(child: widget),
          ),
        ),
        const SizedBox(height: 4),
        Text(text, style: textTheme.labelSmall)
      ],
    );
  }
}
