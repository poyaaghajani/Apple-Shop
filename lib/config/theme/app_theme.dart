import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      fontFamily: 'SM',
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(
          fontSize: 14,
          color: CustomColors.deepGrey,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: CustomColors.dark),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(
            color: CustomColors.blue,
            width: 2,
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          textStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontFamily: 'SM',
              );
            }
            return const TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontFamily: 'SM',
            );
          }),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return CustomColors.blue;
            }
            return CustomColors.blue;
          }),
        ),
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        titleLarge: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: CustomColors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: CustomColors.dark,
        ),
        bodySmall: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: CustomColors.dark,
        ),
      ),
    );
  }
}
