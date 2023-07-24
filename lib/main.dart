import 'package:apple_shop/config/theme/app_theme.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/features/feat-product/data/models/product_model.dart';
import 'package:apple_shop/features/feat_auth/presentation/screens/splash_screen.dart';
import 'package:apple_shop/features/feat_basket/data/models/basket_model.dart';
import 'package:apple_shop/features/feat_favorite/presentation/bloc/favorite_bloc.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // setup system chrome
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: CustomColors.bgColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: CustomColors.bgColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // initalize hive
  await Hive.initFlutter();
  Hive.registerAdapter(BasketModelAdapter());
  Hive.registerAdapter(ProductModelAdapter());
  await Hive.openBox<BasketModel>('basketBox');
  await Hive.openBox<ProductModel>('productBox');

  // initalize get_it
  await getInit();

  runApp(BlocProvider<FavoriteBloc>.value(
    value: locator.get<FavoriteBloc>()..add(GetAllFavoriteProducts()),
    child: const MyApp(),
  ));
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
