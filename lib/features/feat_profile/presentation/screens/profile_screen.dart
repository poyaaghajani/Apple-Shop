import 'package:apple_shop/config/route/route.dart';
import 'package:apple_shop/core/utils/auth_manager.dart';
import 'package:apple_shop/features/feat_auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:apple_shop/features/feat_auth/presentation/screens/login_screen.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String username = AuthManager.readUsername();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(username),
            ElevatedButton(
              onPressed: () {
                AuthManager.logOut();
                context.pushAndRemoveUntil(BlocProvider(
                  create: (context) => locator.get<LoginBloc>(),
                  child: LoginScreen(),
                ));
              },
              child: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
