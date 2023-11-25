import 'package:apple_shop/config/route/route.dart';
import 'package:apple_shop/core/constants/app_defaults.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/widgets/product_item.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat-product/presentation/bloc/product_popularity/product_popularity_bloc.dart';
import 'package:apple_shop/features/feat-product/presentation/screens/product_popularity_screen.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHotestProducts extends StatelessWidget {
  const HomeHotestProducts({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return SliverPadding(
      padding: const EdgeInsets.only(top: Dimens.thirtytwo),
      sliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Dimens.twenty,
              ),
              child: GestureDetector(
                onTap: () {
                  context.push(BlocProvider(
                    create: (context) => locator.get<ProductPopularityBloc>(),
                    child: ProductPopularityScreen(
                      product: products[0],
                    ),
                  ));
                },
                child: Row(
                  children: [
                    Text(
                      'پر بازدید ترین ها',
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
            ),
            SizedBox(
              height: DevSize.getHeight(context) / 3.5,
              child: ListView.builder(
                physics: AppDef.defPhycics,
                padding: const EdgeInsets.only(
                  right: Dimens.twenty,
                  top: Dimens.eightTeen,
                ),
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: Dimens.eightTeen,
                      bottom: Dimens.eight,
                    ),
                    child: ProductItem(product: products[index]),
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
