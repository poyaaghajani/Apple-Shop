import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {},
      child: Container(
        width: DevSize.getWidth(context) / 2.45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 10),
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: DevSize.getWidth(context),
                ),
                SizedBox(
                  width: DevSize.getHeight(context) / 8.1,
                  height: DevSize.getWidth(context) / 4,
                  child: Image.asset('assets/images/iphone.png'),
                ),
                Positioned(
                  right: 6,
                  top: 0,
                  child: SvgPicture.asset(
                    AssetsManager.favUnactive,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      child: Text(
                        '4 %',
                        style: textTheme.labelSmall!.apply(
                          color: CustomColors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: Dimens.ten,
                    right: Dimens.ten,
                  ),
                  child: Text(
                    'سنسسننسنس',
                    textAlign: TextAlign.start,
                    maxLines: 1,
                    style: textTheme.titleSmall,
                  ),
                ),
                Container(
                  height: DevSize.getHeight(context) / 15,
                  decoration: const BoxDecoration(
                    color: CustomColors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: CustomColors.blue,
                        blurRadius: 25,
                        spreadRadius: -14,
                        offset: Offset(0.0, 15.0),
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SizedBox(
                          width: 22,
                          child: SvgPicture.asset(
                            AssetsManager.arrowRightCircle,
                          ),
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '929220',
                              style: textTheme.titleSmall!.apply(
                                color: CustomColors.white,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              '160000550',
                              style: textTheme.titleSmall!.apply(
                                color: CustomColors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'تومان',
                          style: textTheme.labelSmall!.apply(
                            color: CustomColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}