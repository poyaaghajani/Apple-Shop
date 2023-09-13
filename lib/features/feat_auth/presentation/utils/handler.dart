import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/widgets/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

singupHandler(
  TextEditingController nameController,
  TextEditingController passwordController,
  TextEditingController passwordConfirmController,
  String errorMessage,
  BuildContext context,
) {
  if (nameController.text.isEmpty ||
      passwordController.text.isEmpty ||
      passwordConfirmController.text.isEmpty) {
    CustomSnackbar.showSnack(
      context: context,
      icon: SvgPicture.asset(AssetsManager.snackRed),
      title: 'ناموفق',
      titleColor: CustomColors.red,
      message: 'پرکردن فیلد الزامی است',
    );
  } else if (passwordController.text.length < 8 ||
      passwordConfirmController.text.length < 8) {
    CustomSnackbar.showSnack(
      context: context,
      icon: SvgPicture.asset(AssetsManager.snackRed),
      title: 'ناموفق',
      titleColor: CustomColors.red,
      message: 'رمزعبور باید بین 8 تا 72 کلمه باشد',
    );
  } else if (passwordController.text != passwordConfirmController.text) {
    CustomSnackbar.showSnack(
      context: context,
      icon: SvgPicture.asset(AssetsManager.snackRed),
      title: 'ناموفق',
      titleColor: CustomColors.red,
      message: 'رمز عبور و تکرار رمز عبور برابر نیستند',
    );
  } else {
    CustomSnackbar.showSnack(
      context: context,
      icon: SvgPicture.asset(AssetsManager.snackRed),
      title: 'ناموفق',
      titleColor: CustomColors.red,
      message: errorMessage,
    );
  }
}

loginHandler(
  TextEditingController nameController,
  TextEditingController passwordController,
  String errorMessage,
  BuildContext context,
) {
  if (nameController.text.isEmpty || passwordController.text.isEmpty) {
    CustomSnackbar.showSnack(
      context: context,
      icon: SvgPicture.asset(AssetsManager.snackRed),
      title: 'ناموفق',
      titleColor: CustomColors.red,
      message: 'پرکردن فیلد الزامی است',
    );
  } else if (passwordController.text.length < 8) {
    CustomSnackbar.showSnack(
      context: context,
      icon: SvgPicture.asset(AssetsManager.snackRed),
      title: 'ناموفق',
      titleColor: CustomColors.red,
      message: 'رمزعبور باید بین 8 تا 72 کلمه باشد',
    );
  } else {
    CustomSnackbar.showSnack(
      context: context,
      icon: SvgPicture.asset(AssetsManager.snackRed),
      title: 'ناموفق',
      titleColor: CustomColors.red,
      message: errorMessage,
    );
  }
}
