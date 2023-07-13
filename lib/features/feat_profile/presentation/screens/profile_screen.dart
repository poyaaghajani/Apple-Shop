import 'package:apple_shop/config/route/route.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/auth_manager.dart';
import 'package:apple_shop/core/widgets/app_header.dart';
import 'package:apple_shop/features/feat_auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:apple_shop/features/feat_auth/presentation/screens/login_screen.dart';
import 'package:apple_shop/features/feat_profile/presentation/widgets/profile_item.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String username = AuthManager.readUsername();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: CustomColors.bgColor,
      body: SafeArea(
        child: Column(
          children: [
            const AppHeader(title: 'حساب کاربری'),
            Padding(
              padding: const EdgeInsets.only(top: Dimens.thirtytwo),
              child: Text(username),
            ),
            Padding(
              padding: const EdgeInsets.only(top: Dimens.thirtytwo),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: Dimens.thirtytwo,
                runSpacing: Dimens.twenty,
                direction: Axis.horizontal,
                children: [
                  ProfileItem(
                    widget: Image.asset(AssetsManager.setting, height: 28),
                    text: 'تنظیمات',
                    onTap: () {
                      logOutDialog(context, textTheme);
                    },
                  ),
                  ProfileItem(
                    widget: SvgPicture.asset(AssetsManager.order),
                    text: 'سفارشات اخیر',
                    onTap: () {},
                  ),
                  ProfileItem(
                    widget: SvgPicture.asset(AssetsManager.location),
                    text: 'آدرس ها',
                    onTap: () {},
                  ),
                  ProfileItem(
                    widget: SvgPicture.asset(AssetsManager.notify),
                    text: 'اطلاعیه',
                    onTap: () {},
                  ),
                  ProfileItem(
                    widget: SvgPicture.asset(AssetsManager.opinions),
                    text: 'نقد و نظرات',
                    onTap: () {},
                  ),
                  ProfileItem(
                    widget: SvgPicture.asset(AssetsManager.discount),
                    text: 'تخفیف ها',
                    onTap: () {},
                  ),
                  ProfileItem(
                    widget: SvgPicture.asset(AssetsManager.presentOrder),
                    text: 'سفارشات',
                    onTap: () {},
                  ),
                  ProfileItem(
                    widget: SvgPicture.asset(AssetsManager.favorite),
                    text: 'علاقمندی ها',
                    onTap: () {},
                  ),
                  ProfileItem(
                    widget: SvgPicture.asset(AssetsManager.blogs),
                    text: 'بلاگ',
                    onTap: () {},
                  ),
                  ProfileItem(
                    widget: SvgPicture.asset(AssetsManager.phone),
                    text: 'پشتیبانی',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: Dimens.eight),
              child: Text(
                'اپل شاپ',
                style: textTheme.labelSmall!.apply(
                  color: CustomColors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: Dimens.twelve),
              child: Text(
                'V-1.0.00',
                style: textTheme.labelSmall!.apply(
                  color: CustomColors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // logOut dialog
  Future<dynamic> logOutDialog(BuildContext context, TextTheme textTheme) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: CustomColors.bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'از خروج حساب کاربری خود مطمعن هستید؟',
            textAlign: TextAlign.center,
            style: textTheme.bodySmall,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.green),
                  onPressed: () {
                    AuthManager.logOut();
                    context.pushAndRemoveUntil(
                      BlocProvider(
                        create: (context) => locator.get<LoginBloc>(),
                        child: const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text('بله'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColors.red),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('خیر'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
