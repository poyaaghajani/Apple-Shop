import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/app_header.dart';
import 'package:apple_shop/features/feat_favorite/presentation/bloc/favorite_bloc.dart';
import 'package:apple_shop/features/feat_favorite/presentation/widgets/favorite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: AppHeader(
                      title: 'علاقه مندی ها',
                      widget: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(AssetsManager.arrowRightDark),
                      ),
                    ),
                  ),
                  if (state is FavoriteCompleted) ...[
                    state.allFavorites.fold((errorMessage) {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          width: DevSize.getWidth(context),
                          height: DevSize.getHeight(context),
                          child: Center(
                            child: Text(errorMessage),
                          ),
                        ),
                      );
                    }, (products) {
                      return products.isEmpty
                          ? SliverToBoxAdapter(
                              child: SizedBox(
                                width: DevSize.getWidth(context),
                                height: DevSize.getHeight(context),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AssetsManager.emptyFavorite,
                                      height: 200,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: Dimens.eight,
                                        bottom: Dimens.fortyFour,
                                      ),
                                      child: Text(
                                        'درحال حاضر لیست علاقه مندی های شما خالی است...',
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
                              padding: const EdgeInsets.only(
                                top: Dimens.thirtytwo,
                                left: Dimens.twenty,
                                right: Dimens.twenty,
                              ),
                              sliver: SliverList.builder(
                                itemCount: products.length,
                                itemBuilder: (context, index) {
                                  return FavoriteItem(product: products[index]);
                                },
                              ),
                            );
                    }),
                  ],
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
