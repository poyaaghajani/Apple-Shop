import 'package:apple_shop/config/route/route.dart';
import 'package:apple_shop/core/constants/custom_colors.dart';
import 'package:apple_shop/core/constants/dimens.dart';
import 'package:apple_shop/core/utils/assets_manager.dart';
import 'package:apple_shop/core/utils/auth_manager.dart';
import 'package:apple_shop/core/utils/devise_size.dart';
import 'package:apple_shop/core/widgets/button_loading.dart';
import 'package:apple_shop/core/widgets/custom_snackbar.dart';
import 'package:apple_shop/features/feat_auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:apple_shop/features/feat_auth/presentation/bloc/singup_bloc/singup_bloc.dart';
import 'package:apple_shop/features/feat_auth/presentation/screens/singup_screen.dart';
import 'package:apple_shop/features/feat_auth/presentation/widgets/auth_box.dart';
import 'package:apple_shop/features/feat_profile/presentation/screens/profile_screen.dart';
import 'package:apple_shop/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              height: DevSize.getHeight(context),
              width: DevSize.getWidth(context),
              color: CustomColors.blue,
            ),
            Positioned(
              top: Dimens.fortyFour,
              child: Column(
                children: [
                  SvgPicture.asset(AssetsManager.appleWhite),
                  const SizedBox(height: 4),
                  Text(
                    'اپل شاپ',
                    style: textTheme.titleLarge,
                  ),
                ],
              ),
            ),

            // auth box
            AuthBox(
              child: Column(
                children: [
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'نام کاربری',
                    ),
                  ),
                  const SizedBox(height: Dimens.sixTeen),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'رمز عبور',
                    ),
                  ),
                  const Spacer(),
                  BlocConsumer<LoginBloc, LoginState>(
                    listener: (context, state) {
                      if (state is LoginCompleted) {
                        state.response.fold(
                          (errorMessage) {
                            if (_usernameController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              CustomSnackbar.showSnack(
                                  context, 'پرکردن فیلد الزامی است');
                            } else {
                              CustomSnackbar.showSnack(context, errorMessage);
                            }
                          },
                          (success) {
                            AuthManager.saveUsername(_usernameController.text);
                            AuthManager.readUsername();
                            context
                                .pushAndRemoveUntilRTL(const ProfileScreen());
                          },
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is LoginInit) {
                        return ElevatedButton(
                          onPressed: () {
                            AuthManager.readToken();
                            BlocProvider.of<LoginBloc>(context).add(
                              LoginPressed(
                                identity: _usernameController.text,
                                password: _passwordController.text,
                              ),
                            );
                          },
                          child: const Text('ورود به حساب کاربری'),
                        );
                      }
                      if (state is LoginLoading) {
                        return const ButtonLoading();
                      }
                      if (state is LoginCompleted) {
                        return state.response.fold(
                          (errorMessage) {
                            return ElevatedButton(
                              onPressed: () {
                                AuthManager.readToken();
                                BlocProvider.of<LoginBloc>(context).add(
                                  LoginPressed(
                                    identity: _usernameController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              },
                              child: const Text('تلاش مجدد'),
                            );
                          },
                          (success) {
                            return ElevatedButton(
                              onPressed: () {
                                AuthManager.readToken();
                                BlocProvider.of<LoginBloc>(context).add(
                                  LoginPressed(
                                    identity: _usernameController.text,
                                    password: _passwordController.text,
                                  ),
                                );
                              },
                              child: const Text('ورود به حساب کاربری'),
                            );
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
                  ),
                  const SizedBox(height: Dimens.eight),
                  InkWell(
                    onTap: () {
                      context.push(
                        BlocProvider(
                          create: (context) => locator.get<SingupBloc>(),
                          child: const SingUpScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'ساخت حساب کاربری جدید',
                      style: textTheme.bodySmall,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
