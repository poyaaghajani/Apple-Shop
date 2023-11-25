import 'dart:async';
import 'package:apple_shop/core/utils/change_banner_page.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/loading_widget.dart';
import 'package:apple_shop/features/feat_home/presentation/bloc/home_bloc.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_banner.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_category.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_header.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_hotest_product.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_bestseller_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller =
      PageController(viewportFraction: 0.93, initialPage: 0);
  Timer? _timer;
  final int _currentPage = 0;

  // init state
  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(HomeRequest());
    super.initState();
  }

  // dispose
  @override
  void dispose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              //loading
              if (state is HomeLoading) ...[
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: DevSize.getWidth(context),
                    height: DevSize.getHeight(context),
                    child: const Center(
                      child: LoadingWidget(),
                    ),
                  ),
                ),
              ],

              // home header
              if (state is HomeCompleted) ...[
                const HomeHeader(),
              ],

              // home banner
              if (state is HomeCompleted) ...[
                state.banners.fold((errorMessage) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: DevSize.getHeight(context) / 4.5,
                      child: Center(
                        child: Text(errorMessage, style: textTheme.bodySmall),
                      ),
                    ),
                  );
                }, (baners) {
                  changeBannerPage(
                    timer: _timer,
                    controller: controller,
                    length: baners.length,
                    currentPage: _currentPage,
                  );
                  return HomeBanner(
                    controller: controller,
                    banners: baners,
                  );
                }),
              ],

              // home categories
              if (state is HomeCompleted) ...[
                state.categories.fold((errorMessage) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: DevSize.getHeight(context) / 7.5,
                      child: Center(
                        child: Text(errorMessage, style: textTheme.bodySmall),
                      ),
                    ),
                  );
                }, (categories) {
                  return HomeCategories(categories: categories);
                }),
              ],

              // home hotest products
              if (state is HomeCompleted) ...[
                state.hotestProducts.fold((errorMessage) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: DevSize.getHeight(context) / 3.5,
                      child: Center(
                        child: Text(errorMessage, style: textTheme.bodySmall),
                      ),
                    ),
                  );
                }, (hotestProducts) {
                  return HomeHotestProducts(products: hotestProducts);
                }),
              ],

              // home best seller products
              if (state is HomeCompleted) ...[
                state.bestSellerProducts.fold((errorMessage) {
                  return SliverToBoxAdapter(
                    child: SizedBox(
                      height: DevSize.getHeight(context) / 3.5,
                      child: Center(
                        child: Text(errorMessage, style: textTheme.bodySmall),
                      ),
                    ),
                  );
                }, (bestSellerProducts) {
                  return HomeBestSellerProducts(products: bestSellerProducts);
                }),
              ],
            ],
          );
        },
      ),
    );
  }
}
