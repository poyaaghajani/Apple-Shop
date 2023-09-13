import 'package:another_flushbar/flushbar.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomSnackbar {
  static showSnack({
    required BuildContext context,
    required String message,
    required String title,
    required Color titleColor,
    required Widget icon,
  }) {
    Flushbar(
      title: title,
      titleColor: titleColor,
      titleSize: 16,
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 27),
        child: icon,
      ),
      message: message,
      padding: const EdgeInsets.symmetric(vertical: 8),
      messageColor: CustomColors.deepGrey,
      messageSize: 12,
      boxShadows: [
        BoxShadow(
          color: Colors.grey.shade200,
          offset: const Offset(1, 1),
          blurRadius: 3,
        ),
      ],
      backgroundColor: CustomColors.white,
      duration: const Duration(milliseconds: 1500),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      borderRadius: BorderRadius.circular(10),
      positionOffset: 50,
      flushbarPosition: FlushbarPosition.TOP,
    ).show(context);
  }
}
