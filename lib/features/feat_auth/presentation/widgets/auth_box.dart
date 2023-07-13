import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:flutter/material.dart';

class AuthBox extends StatelessWidget {
  const AuthBox({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: DevSize.getHeight(context) / 2,
        width: DevSize.getWidth(context),
        margin: const EdgeInsets.only(
          left: Dimens.sixTeen,
          right: Dimens.sixTeen,
          bottom: Dimens.twenty,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: Dimens.twelve,
          vertical: Dimens.twenty,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: CustomColors.white,
        ),
        child: child);
  }
}
