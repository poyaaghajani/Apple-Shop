import 'dart:async';
import 'package:flutter/material.dart';

// craete a function to update home banners every 3 seconds
void changeBannerPage({
  required Timer? timer,
  required int currentPage,
  required int length,
  required PageController controller,
}) {
  timer ??= Timer.periodic(const Duration(seconds: 3), (Timer timer) {
    if (currentPage < length - 1) {
      currentPage++;
    } else {
      currentPage = 0;
    }

    if (controller.positions.isNotEmpty) {
      controller.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    }
  });
}
