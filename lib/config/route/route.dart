import 'package:flutter/material.dart';

extension Push on BuildContext {
  push(Widget widget) {
    return Navigator.of(this).push(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ));
  }
}

extension PushAndRemoveUntil on BuildContext {
  pushAndRemoveUntil(Widget widget) {
    return Navigator.of(this).pushAndRemoveUntil(MaterialPageRoute(
      builder: (context) {
        return widget;
      },
    ), (route) => false);
  }
}

extension PushAndRemoveUntilRTL on BuildContext {
  pushAndRemoveUntilRTL(Widget widget) {
    return Navigator.of(this).pushAndRemoveUntil(
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 700),
          reverseTransitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (context, animation, _) {
            const begin = Offset(1, 0);
            const end = Offset.zero;
            const curve = Curves.fastEaseInToSlowEaseOut;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: widget,
            );
          },
        ),
        (route) => false);
  }
}
