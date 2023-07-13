import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class AppDef {
  AppDef._();

  // physics
  static const defPhycics = BouncingScrollPhysics();

  // bottom navigation item decoration
  static const defNavigationDecoration = BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: CustomColors.blue,
        blurRadius: 20,
        spreadRadius: -20,
        offset: Offset(0.0, 13),
      ),
    ],
  );
}
