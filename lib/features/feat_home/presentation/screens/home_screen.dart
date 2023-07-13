import 'dart:async';
import 'package:apple_shop/core/utils/my_scroll_behavor.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_banner.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_category.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_header.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_hotest_product.dart';
import 'package:apple_shop/features/feat_home/presentation/widgets/home_mostview_product.dart';
import 'package:flutter/material.dart';

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
      child: CustomScrollView(
        slivers: [
          // home header
          const HomeHeader(),

          // home banner
          HomeBanner(controller: controller),

          // home categories
          const HomeCategories(),

          // home hotest products
          const HomeHotestProducts(),

          // home most view products
          const HomeMostViewProducts(),
        ],
      ),
    );
  }
}
