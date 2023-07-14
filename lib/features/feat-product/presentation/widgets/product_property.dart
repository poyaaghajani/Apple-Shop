import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductProperties extends StatelessWidget {
  const ProductProperties({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SliverPadding(
      padding: const EdgeInsets.only(top: Dimens.twenty),
      sliver: SliverToBoxAdapter(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: Dimens.twenty),
          height: DevSize.getHeight(context) / 17,
          width: DevSize.getWidth(context),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: CustomColors.grey),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Text(' مشخصات فنی:', style: textTheme.labelSmall),
                const Spacer(),
                Text('مشاهده', style: textTheme.labelSmall),
                const SizedBox(width: 10),
                SvgPicture.asset(AssetsManager.arrowLeftBlue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
