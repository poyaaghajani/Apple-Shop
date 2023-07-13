import 'package:apple_shop/core/constants/app_defaults.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeMostViewProducts extends StatelessWidget {
  const HomeMostViewProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SliverPadding(
      padding:
          const EdgeInsets.only(top: Dimens.thirtytwo, bottom: Dimens.twenty),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.twenty,
              ),
              child: Row(
                children: [
                  Text(
                    'پر فروش ترین ها',
                    style: textTheme.displaySmall,
                  ),
                  const Spacer(),
                  Text(
                    'مشاهده همه',
                    style: textTheme.displaySmall!.apply(
                      color: CustomColors.blue,
                    ),
                  ),
                  const SizedBox(width: Dimens.eight),
                  SvgPicture.asset(AssetsManager.arrowLeftBlue),
                ],
              ),
            ),
            SizedBox(
              height: DevSize.getHeight(context) / 3.6,
              child: ListView.builder(
                physics: AppDef.defPhycics,
                padding: const EdgeInsets.only(
                  right: Dimens.twenty,
                  top: Dimens.eightTeen,
                ),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(left: Dimens.eightTeen),
                    child: ProductItem(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
