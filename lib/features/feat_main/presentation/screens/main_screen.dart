import 'dart:ui';
import 'package:apple_shop/core/constants/app_defaults.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/features/feat_basket/presentation/screens/basket_screen.dart';
import 'package:apple_shop/features/feat_category/presentation/screens/category_screen.dart';
import 'package:apple_shop/features/feat_home/presentation/screens/home_screen.dart';
import 'package:apple_shop/features/feat_profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

int selectedBottomNavigation = 0;

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: SafeArea(
        child: IndexedStack(
          index: selectedBottomNavigation,
          children: getScreens(),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
          child: BottomNavigationBar(
            onTap: (int index) {
              setState(() {
                selectedBottomNavigation = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedBottomNavigation,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            selectedItemColor: CustomColors.blue,
            unselectedItemColor: CustomColors.grey,
            backgroundColor: Colors.transparent,
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsManager.home),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Container(
                    decoration: AppDef.defNavigationDecoration,
                    child: SvgPicture.asset(AssetsManager.homeActive),
                  ),
                ),
                label: 'خانه',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsManager.category),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Container(
                    decoration: AppDef.defNavigationDecoration,
                    child: SvgPicture.asset(AssetsManager.categoryActive),
                  ),
                ),
                label: 'دسته بندی',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsManager.basket),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Container(
                    decoration: AppDef.defNavigationDecoration,
                    child: SvgPicture.asset(AssetsManager.basketActive),
                  ),
                ),
                label: 'سبد خرید',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset(AssetsManager.profile),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 3),
                  child: Container(
                    decoration: AppDef.defNavigationDecoration,
                    child: SvgPicture.asset(AssetsManager.profileActive),
                  ),
                ),
                label: 'حساب شخصی',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// main screens
List<Widget> getScreens() {
  return <Widget>[
    HomeScreen(),
    CategoryScreen(),
    BasketScreen(),
    ProfileScreen(),
  ];
}
