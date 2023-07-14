import 'package:apple_shop/config/route/route.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/widgets/cached_image.dart';
import 'package:apple_shop/features/faet-product/data/models/product_model.dart';
import 'package:apple_shop/features/faet-product/presentation/screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        context.push(const ProductDetailScreen());
      },
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
                  child: CachedImage(
                    imageUrl: product.thumbnail,
                    radius: 8,
                  ),
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
                        '% ${product.persent!.round().toString()}',
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
                    product.name,
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
                              product.price.toString(),
                              style: textTheme.titleSmall!.apply(
                                color: CustomColors.white,
                                decoration: TextDecoration.lineThrough,
                              ),
                            ),
                            Text(
                              product.realPrice.toString(),
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
