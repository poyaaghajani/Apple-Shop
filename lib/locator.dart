import 'package:apple_shop/features/feat_auth/data/datasource/auth_datasource.dart';
import 'package:apple_shop/features/feat_auth/data/repository/auth_repository.dart';
import 'package:apple_shop/features/feat_auth/presentation/bloc/login_bloc/login_bloc.dart';
import 'package:apple_shop/features/feat_auth/presentation/bloc/singup_bloc/singup_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locator = GetIt.instance;

Future<void> getInit() async {
  // components
  locator.registerSingleton<Dio>(Dio(
    BaseOptions(baseUrl: 'http://startflutter.ir/api/'),
  ));
  locator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());

  // datasource
  locator.registerSingleton<IAuthDatasource>(AuthDatasource(locator()));

  // repositories
  locator.registerSingleton<IAuthRepository>(AuthRepository(locator()));

  // blocs
  locator.registerFactory<LoginBloc>(() => LoginBloc(locator()));
  locator.registerFactory<SingupBloc>(() => SingupBloc(locator()));
}
