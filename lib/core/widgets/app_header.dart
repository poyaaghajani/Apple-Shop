import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({super.key, required this.title, this.widget});

  final String title;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      height: DevSize.getHeight(context) / 17,
      width: DevSize.getWidth(context),
      margin: const EdgeInsets.only(
        right: Dimens.sixTeen,
        left: Dimens.sixTeen,
        top: Dimens.twenty,
      ),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.twenty),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            widget ?? const SizedBox(),
            Expanded(
              child: Center(
                child: Text(
                  title,
                  style: textTheme.labelMedium,
                ),
              ),
            ),
            SvgPicture.asset(AssetsManager.appleBlue),
          ],
        ),
      ),
    );
  }
}
