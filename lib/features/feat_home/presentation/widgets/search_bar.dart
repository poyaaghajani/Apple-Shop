import 'package:apple_shop/config/route/route.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/features/feat-product/presentation/bloc/get_all_products/get_all_products_bloc.dart';
import 'package:apple_shop/features/feat_home/presentation/screens/search_products_screen.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
    this.isNavigate = true,
    this.readOnly = true,
    this.onChanged,
  });

  final bool isNavigate;
  final bool readOnly;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Container(
      height: DevSize.getHeight(context) / 17,
      margin: const EdgeInsets.only(
        right: Dimens.sixTeen,
        left: Dimens.sixTeen,
        top: Dimens.twenty,
      ),
      child: TextField(
        readOnly: readOnly,
        onChanged: onChanged,
        autofocus: true,
        onTap: () {
          if (isNavigate == true) {
            context.push(
              BlocProvider(
                create: (context) => locator.get<GetAllProductsBloc>()
                  ..add(GetAllProductsRequest()),
                child: const SearchProductsScreen(),
              ),
            );
          }
        },
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(8),
          hintText: 'جستجوی محصولات',
          suffixIcon: Container(
            padding: const EdgeInsets.all(Dimens.ten),
            child: SvgPicture.asset(AssetsManager.appleBlue),
          ),
          prefixIcon: Container(
            padding: const EdgeInsets.all(Dimens.ten),
            child: SvgPicture.asset(AssetsManager.search),
          ),
          hintStyle: textTheme.labelMedium!.apply(color: CustomColors.grey),
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),
    );
  }
}
