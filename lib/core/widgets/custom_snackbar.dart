import 'package:another_flushbar/flushbar.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static showSnack(context, String message) {
    Flushbar(
      message: message,
      textDirection: TextDirection.rtl,
      messageColor: CustomColors.white,
      backgroundColor: CustomColors.dark,
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      borderRadius: BorderRadius.circular(8),
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
