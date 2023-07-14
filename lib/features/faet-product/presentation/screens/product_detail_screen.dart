import 'dart:ui';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/app_header.dart';
import 'package:apple_shop/features/faet-product/presentation/widgets/color_variant.dart';
import 'package:apple_shop/features/faet-product/presentation/widgets/product_comment.dart';
import 'package:apple_shop/features/faet-product/presentation/widgets/product_description.dart';
import 'package:apple_shop/features/faet-product/presentation/widgets/product_gallery.dart';
import 'package:apple_shop/features/faet-product/presentation/widgets/product_property.dart';
import 'package:apple_shop/features/faet-product/presentation/widgets/storage_variant.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: CustomScrollView(
            slivers: [
              // app header
              const SliverToBoxAdapter(
                child: AppHeader(title: 'محصولات'),
              ),

              // product title
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: Dimens.thirtytwo),
                    child: Text(
                      'آیفون SE 2022',
                      style: textTheme.bodyMedium,
                    ),
                  ),
                ),
              ),

              // product galllery
              const ProductGallery(),

              // color variant
              const ColorVariant(),

              // storage variant
              const StorageVariant(),

              // product properties
              const ProductProperties(),

              // product description
              const ProductDescription(),

              // product comments
              const ProductComments(),

              // add to basket and prie button
              const SliverPadding(
                padding: EdgeInsets.only(
                  top: Dimens.thirtytwo,
                  left: Dimens.twenty,
                  right: Dimens.twenty,
                ),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // add to basket button
                      AddToBasketButton(),

                      // price button
                      PriceButton(),
                    ],
                  ),
                ),
              ),

              const SliverPadding(
                padding: EdgeInsets.only(bottom: Dimens.thirtytwo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// price button
class PriceButton extends StatelessWidget {
  const PriceButton({super.key});

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
                              '%3',
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
                            '17,000,000',
                            style: textTheme.labelSmall!.apply(
                              color: CustomColors.white,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          Text(
                            '16,500,000',
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

// add to basket button
class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key});

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
            color: CustomColors.blue,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          top: 5,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: DevSize.getHeight(context) / 15,
                  width: DevSize.getWidth(context) / 2.45,
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  child: Center(
                    child: Text(
                      'افزودن سبد خرید',
                      style: textTheme.bodySmall!.apply(
                        color: CustomColors.white,
                      ),
                    ),
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
