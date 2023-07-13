import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/app_header.dart';
import 'package:apple_shop/features/feat_basket/presentation/widgets/basket_item.dart';
import 'package:flutter/material.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        ScrollConfiguration(
          behavior: MyBehavior(),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: AppHeader(title: 'سبد خرید'),
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  top: Dimens.thirtytwo,
                  left: Dimens.twenty,
                  right: Dimens.twenty,
                  bottom: DevSize.getHeight(context) / 9,
                ),
                sliver: SliverList.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return const BasketItem();
                  },
                ),
              )
            ],
          ),
        ),
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
            child: const Text('قیمت نهایی'),
          ),
        ),
      ],
    );
  }
}
