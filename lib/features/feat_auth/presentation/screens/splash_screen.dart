import 'package:apple_shop/config/route/route.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/auth_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/features/feat_auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:apple_shop/features/feat_auth/presentation/screens/login_screen.dart';
import 'package:apple_shop/features/feat_auth/presentation/widgets/custom_circle.dart';
import 'package:apple_shop/features/feat_main/presentation/screens/main_screen.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> scaleAnimation =
      Tween<double>(begin: 55, end: 65).animate(_animationController);

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    final CurvedAnimation curve = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    scaleAnimation = Tween<double>(begin: 55, end: 65).animate(curve);

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });

    // Repeat the animation indefinitely with forward and reverse motions
    _animationController.repeat(min: 0, max: 1, reverse: true);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: DevSize.getHeight(context),
            width: DevSize.getWidth(context),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomColors.lightBlue,
                  CustomColors.blue,
                ],
              ),
            ),
          ),

          // custom circle
          Positioned(
            top: DevSize.getHeight(context) / 11.4,
            child: CustomCircle(
              widget: Column(
                children: [
                  SvgPicture.asset(AssetsManager.appleWhite),
                  const SizedBox(height: 4),
                  Text(
                    'اپل شاپ',
                    style: textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: DevSize.getHeight(context) / 1.66,
            right: Dimens.fortyFour,
            child: Text(
              'اوج هیجان\nبا خرید محصولات\nاپل!',
              textAlign: TextAlign.start,
              style: textTheme.titleLarge!.copyWith(
                fontSize: 32,
              ),
            ),
          ),

          // navigate button
          Padding(
            padding: EdgeInsets.only(
              left: DevSize.getWidth(context) / 1.5,
              top: DevSize.getHeight(context) / 1.5,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    var token = AuthManager.readToken();
                    var username = AuthManager.readUsername();

                    if (token.isEmpty && username.isEmpty) {
                      context.pushAndRemoveUntilRTL(
                        BlocProvider(
                          create: (context) => locator.get<LoginBloc>(),
                          child: const LoginScreen(),
                        ),
                      );
                    } else {
                      context.pushAndRemoveUntilRTL(const MainScreen());
                    }
                  },
                  child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          AnimatedBuilder(
                            animation: _animationController,
                            builder: (context, child) {
                              return Container(
                                width: scaleAnimation.value,
                                height: scaleAnimation.value,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: CustomColors.deepBlue,
                                ),
                              );
                            },
                          ),
                          SvgPicture.asset(AssetsManager.arrowRightCircle),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 10,
            child: Text(
              'بزن بریم',
              style: textTheme.titleSmall!.apply(
                color: CustomColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
