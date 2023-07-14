import 'dart:async';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/core/widgets/loading_widget.dart';
import 'package:apple_shop/features/feat_home/presentation/bloc/home_bloc.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_banner.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_category.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_header.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_hotest_product.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_mostview_product.dart';
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
  int _currentPage = 0;

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
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
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
              if (state is HomeCompleted) ...[
                // home header
                const HomeHeader(),

                // home banner
                state.banners.fold((errorMessage) {
                  return SliverToBoxAdapter(
                    child: Text(errorMessage),
                  );
                }, (baners) {
                  _timer ??=
                      Timer.periodic(const Duration(seconds: 3), (Timer timer) {
                    if (_currentPage < baners.length - 1) {
                      _currentPage++;
                    } else {
                      _currentPage = 0;
                    }

                    if (controller.positions.isNotEmpty) {
                      controller.animateToPage(
                        _currentPage,
                        duration: const Duration(milliseconds: 350),
                        curve: Curves.easeIn,
                      );
                    }
                  });

                  return HomeBanner(
                    controller: controller,
                    banners: baners,
                  );
                }),

                // home categories
                const HomeCategories(),

                // home hotest products
                const HomeHotestProducts(),

                // home most view products
                const HomeMostViewProducts(),
              ],
            ],
          );
        },
      ),
    );
  }
}
