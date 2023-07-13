import 'package:apple_shop/config/route/route.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/auth_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/features/feat_auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:apple_shop/features/feat_auth/presentation/screens/login_screen.dart';
import 'package:apple_shop/features/feat_auth/presentation/widgets/custom_circle.dart';
import 'package:apple_shop/features/feat_profile/presentation/screens/profile_screen.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
          Positioned(
            top: DevSize.getHeight(context) / 1.26,
            right: Dimens.fortyFour,
            child: InkWell(
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
                  context.pushAndRemoveUntilRTL(ProfileScreen());
                }
              },
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomColors.deepBlue,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: SvgPicture.asset(AssetsManager.arrowRightCircle),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
