import 'dart:ui';

import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_basket/presentation/bloc/add_basket/add_basket_bloc.dart';
import 'package:apple_shop/features/feat_basket/presentation/bloc/get_basket/get_basket_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddToBasketButton extends StatelessWidget {
  const AddToBasketButton({super.key, required this.product});

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
                onTap: () {
                  context
                      .read<AddBasketBloc>()
                      .add(AddProductToBasket(product));
                  context.read<GetBasketBloc>().add(GetAllBasketProducts());
                },
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
