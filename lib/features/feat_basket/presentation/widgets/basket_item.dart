import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/extensions/price_formatter.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/widgets/cached_image.dart';
import 'package:apple_shop/core/widgets/custom_snackbar.dart';
import 'package:apple_shop/features/feat_basket/data/models/basket_model.dart';
import 'package:apple_shop/features/feat_basket/presentation/bloc/get_basket/get_basket_bloc.dart';
import 'package:apple_shop/features/feat_basket/presentation/bloc/remove_basket/remove_basket_bloc.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BasketItem extends StatelessWidget {
  const BasketItem({
    super.key,
    required this.basket,
    required this.index,
  });

  final BasketModel basket;
  final int index;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      width: DevSize.getWidth(context),
      padding: const EdgeInsets.all(Dimens.twelve),
      margin: const EdgeInsets.only(
        bottom: Dimens.twenty,
      ),
      height: DevSize.getHeight(context) / 3.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: DevSize.getHeight(context) / 8,
                      child: CachedImage(
                        imageUrl: basket.thumbnail,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: Dimens.twelve),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: DevSize.getWidth(context) / 1.9,
                      child: Text(
                        basket.name,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodyMedium!.copyWith(fontSize: 15),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: Dimens.twelve),
                      child: Row(
                        children: [
                          Text(
                            '${basket.price.priceFormatter()} تومان',
                            style: textTheme.bodySmall!.apply(
                              color: CustomColors.grey,
                            ),
                          ),
                          const SizedBox(width: Dimens.eight),
                          Container(
                            decoration: BoxDecoration(
                              color: CustomColors.red,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 6, vertical: 2),
                              child: Center(
                                child: Text(
                                  '${basket.persent!.round()} %',
                                  style: textTheme.labelSmall!.apply(
                                    color: CustomColors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: Dimens.twenty),
                      child: Wrap(
                        spacing: Dimens.ten,
                        runSpacing: Dimens.eight,
                        children: [
                          ItemChip(
                            text: 'ذخیره',
                            widget: SvgPicture.asset(
                              AssetsManager.favActive,
                              height: 15,
                            ),
                            onTap: () {},
                          ),
                          ItemChip(
                            text: 'قرمز',
                            widget: Container(
                              width: 10,
                              height: 10,
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            onTap: () {},
                          ),

                          // remove product from basket item chip
                          BlocConsumer<RemoveBasketBloc, RemoveBasketState>(
                            listener: (context, state) {
                              if (state is RemoveBasketCompleted) {
                                state.removeFromBasket.fold((errorMessage) {
                                  CustomSnackbar.showSnack(
                                      context, errorMessage);
                                }, (successMessage) {
                                  CustomSnackbar.showSnack(
                                      context, successMessage);
                                });
                              }
                            },
                            builder: (context, state) {
                              if (state is RemoveBasketInit) {
                                return ItemChip(
                                  text: 'حذف',
                                  widget: SvgPicture.asset(AssetsManager.bin),
                                  onTap: () {
                                    context
                                        .read<RemoveBasketBloc>()
                                        .add(RemoveProductFromBasket(index));
                                    context
                                        .read<GetBasketBloc>()
                                        .add(GetAllBasketProducts());
                                  },
                                );
                              }
                              if (state is RemoveBasketCompleted) {
                                return state.removeFromBasket.fold((error) {
                                  return ItemChip(
                                    text: 'حذف مجدد',
                                    widget: SvgPicture.asset(AssetsManager.bin),
                                    onTap: () {
                                      context
                                          .read<RemoveBasketBloc>()
                                          .add(RemoveProductFromBasket(index));
                                      context
                                          .read<GetBasketBloc>()
                                          .add(GetAllBasketProducts());
                                    },
                                  );
                                }, (success) {
                                  return ItemChip(
                                    text: 'حذف',
                                    widget: SvgPicture.asset(AssetsManager.bin),
                                    onTap: () {
                                      context
                                          .read<RemoveBasketBloc>()
                                          .add(RemoveProductFromBasket(index));
                                      context
                                          .read<GetBasketBloc>()
                                          .add(GetAllBasketProducts());
                                    },
                                  );
                                });
                              } else {
                                return const SizedBox();
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const DottedLine(
            direction: Axis.horizontal,
            lineLength: double.infinity,
            lineThickness: 1.0,
            dashLength: 4.0,
            dashColor: CustomColors.grey,
            dashGapLength: 4.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: Dimens.eightTeen),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(basket.realPrice!.priceFormatter(),
                    style: textTheme.bodyMedium),
                const SizedBox(width: Dimens.eight),
                Text(
                  'تومان',
                  style: textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemChip extends StatelessWidget {
  const ItemChip({
    super.key,
    required this.text,
    required this.widget,
    required this.onTap,
  });

  final String text;
  final Widget widget;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: CustomColors.grey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: textTheme.labelSmall!.apply(
                  color: CustomColors.grey,
                ),
              ),
              const SizedBox(width: 4),
              widget,
            ],
          ),
        ),
      ),
    );
  }
}
