import 'package:apple_shop/config/theme/app_theme.dart';
import 'package:apple_shop/features/feat_auth/presentation/screens/splash_screen.dart';
import 'package:apple_shop/features/feat_basket/data/models/basket_model.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initalize hive
  await Hive.initFlutter();
  Hive.registerAdapter(BasketModelAdapter());
  await Hive.openBox<BasketModel>('basketBox');

  // initalize get_it
  await getInit();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme(context),
      debugShowCheckedModeBanner: false,
      locale: const Locale('fa'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('fa'),
      ],
      home: const SplashScreen(),
    );
  }
}
