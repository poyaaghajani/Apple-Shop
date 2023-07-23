import 'dart:ui';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/extensions/price_formatter.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:flutter/material.dart';

class PriceButton extends StatelessWidget {
  const PriceButton({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Stack(
      alignment: Alignment.bottomCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: DevSize.getWidth(context) / 2.8,
          height: DevSize.getHeight(context) / 17,
          decoration: BoxDecoration(
            color: CustomColors.green,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          top: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                height: DevSize.getHeight(context) / 15,
                width: DevSize.getWidth(context) / 2.45,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 6,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomColors.red,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 6),
                            child: Text(
                              '%${product.persent!.round()}',
                              style: textTheme.labelSmall!.apply(
                                color: CustomColors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            product.price.priceFormatter(),
                            style: textTheme.labelSmall!.apply(
                              color: CustomColors.white,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            product.realPrice!.priceFormatter(),
                            style: textTheme.bodySmall!.apply(
                              color: CustomColors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: Dimens.eight),
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
            ),
          ),
        ),
      ],
    );
  }
}
