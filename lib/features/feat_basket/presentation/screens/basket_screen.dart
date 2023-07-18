// ignore_for_file: prefer_is_empty

import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/extensions/price_formatter.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/app_header.dart';
import 'package:apple_shop/features/feat_basket/presentation/bloc/get_basket/get_basket_bloc.dart';
import 'package:apple_shop/features/feat_basket/presentation/widgets/basket_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return BlocBuilder<GetBasketBloc, GetBasketState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            if (state is GetBasketCompleted) ...[
              ScrollConfiguration(
                behavior: MyBehavior(),
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: AppHeader(title: 'سبد خرید'),
                    ),
                    state.basketProducts.fold(
                      (errorMessage) {
                        return SliverToBoxAdapter(
                          child: Expanded(
                            child: SizedBox(
                              child: Text(errorMessage),
                            ),
                          ),
                        );
                      },
                      (basket) {
                        return basket.length == 0
                            ? SliverToBoxAdapter(
                                child: SizedBox(
                                  width: DevSize.getWidth(context),
                                  height: DevSize.getHeight(context),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset(
                                        AssetsManager.emptyBasket,
                                        height: 200,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          top: Dimens.eight,
                                          bottom: Dimens.fortyFour,
                                        ),
                                        child: Text(
                                          'درحال حاضر سبد خرید شما خالی است...',
                                          style: textTheme.bodySmall!.apply(
                                            color: CustomColors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SliverPadding(
                                padding: EdgeInsets.only(
                                  top: Dimens.thirtytwo,
                                  left: Dimens.twenty,
                                  right: Dimens.twenty,
                                  bottom: DevSize.getHeight(context) / 9,
                                ),
                                sliver: SliverList.builder(
                                  itemCount: basket.length,
                                  itemBuilder: (context, index) {
                                    return BasketItem(
                                      basket: basket[index],
                                      index: index,
                                    );
                                  },
                                ),
                              );
                      },
                    ),
                  ],
                ),
              ),
            ],

            // basket final price
            Positioned(
              bottom: Dimens.twenty,
              right: Dimens.twenty,
              left: Dimens.twenty,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(
                    DevSize.getWidth(context),
                    DevSize.getHeight(context) / 15,
                  ),
                  backgroundColor: CustomColors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {},
                child: BlocBuilder<GetBasketBloc, GetBasketState>(
                  builder: (context, state) {
                    if (state is GetBasketCompleted) {
                      return Text(
                        state.basketFinalPrice == 0
                            ? 'سبد خرید خالی است'
                            : '${state.basketFinalPrice.priceFormatter()} تومان',
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
